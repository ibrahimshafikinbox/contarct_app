import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:client_project/Core/Helper/files_helper.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/view/contract_home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ContractDetails extends StatefulWidget {
  const ContractDetails({
    Key? key,
    required this.contract,
  }) : super(key: key);

  final Map<String, dynamic> contract;

  @override
  State<ContractDetails> createState() => _ContractDetailsState();
}

class _ContractDetailsState extends State<ContractDetails> {
  double _downloadProgress = 0.0;
  bool _isInvoiceLoading =
      false; // used to show loading indicator for invoice generation
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic> _customerData = {};

  @override
  void initState() {
    super.initState();
    _fetchCustomerData();
  }

  // Future<void> _downloadAndOpenFile() async {
  //   String? url = widget.contract["contract_url"];
  //   String fileName = widget.contract["contract_name"] ?? "document";

  //   if (url == null || url.isEmpty) {
  //     Fluttertoast.showToast(msg: "No document URL provided.");
  //     return;
  //   }

  //   // Determine the file extension (PDF or DOCX)
  //   String fileExtension = url.endsWith(".docx") ? ".docx" : ".pdf";
  //   String fullFileName = "$fileName$fileExtension";

  //   // Request storage permission
  //   if (!(await _requestStoragePermission())) {
  //     Fluttertoast.showToast(msg: "Storage permission denied.");
  //     return;
  //   }

  //   try {
  //     // Try to use the Downloads directory; if not, fallback to external storage
  //     Directory? directory = Directory("/storage/emulated/0/Download");
  //     if (!await directory.exists()) {
  //       directory = await getExternalStorageDirectory();
  //     }

  //     String savePath = "${directory!.path}/$fullFileName";
  //     String? filePath =
  //         await FileHelper.downloadFile(url, savePath, (progress) {
  //       setState(() {
  //         _downloadProgress = progress;
  //       });
  //     });

  //     if (filePath != null) {
  //       print("✅ File saved at: $filePath");
  //       File file = File(filePath);

  //       if (await file.exists()) {
  //         await OpenFilex.open(filePath);
  //       } else {
  //         Fluttertoast.showToast(msg: "Error: File was not saved properly.");
  //       }
  //     } else {
  //       Fluttertoast.showToast(msg: "Failed to download the file.");
  //     }
  //   } catch (e) {
  //     print("Error downloading file: $e");
  //     Fluttertoast.showToast(msg: "Error: ${e.toString()}");
  //   }
  // }

  // Future<bool> _requestStoragePermission() async {
  //   PermissionStatus status = await Permission.storage.request();
  //   return status.isGranted;
  // }
  MethodChannel _channel = MethodChannel('com.example.client_project/files');
  Future<void> _downloadAndOpenFile() async {
    String? url = widget.contract["contract_url"];
    String fileName = widget.contract["contract_name"] ?? "document";

    if (url == null || url.isEmpty) {
      Fluttertoast.showToast(msg: "❌ No document URL provided.");
      return;
    }

    // **تغيير الامتداد إلى .docx دائمًا**
    String fullFileName = "$fileName.docx";

    if (!(await _requestStoragePermission())) {
      Fluttertoast.showToast(msg: "❌ Storage permission denied.");
      return;
    }

    try {
      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory("/storage/emulated/0/Download");
        if (!(await directory.exists())) {
          await directory.create(recursive: true);
        }
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      String savePath = "${directory.path}/$fullFileName";

      String? filePath =
          await FileHelper.downloadFile(url, savePath, (progress) {
        setState(() {
          _downloadProgress = progress;
        });
      });

      if (filePath != null) {
        Fluttertoast.showToast(msg: "✅ File downloaded: $filePath");

        // استدعاء المسح الضوئي للملف ليظهر في مدير الملفات
        try {
          await _channel.invokeMethod('scanFile', {'filePath': filePath});
        } catch (e) {
          print("❌ Error scanning file: $e");
        }

        File file = File(filePath);
        if (await file.exists()) {
          await OpenFilex.open(filePath);
        } else {
          Fluttertoast.showToast(msg: "❌ Error: File was not saved properly.");
        }
      } else {
        Fluttertoast.showToast(msg: "❌ Failed to download the file.");
      }
    } catch (e) {
      print("❌ Error downloading file: $e");
      Fluttertoast.showToast(msg: "❌ Error: ${e.toString()}");
    }
  }

  Future<String> _saveToDownloadsUsingMediaStore(
      Uint8List bytes, String fileName) async {
    final DateTime formattedDate = DateTime.now();
    // final String formattedDate = DateFormat('yyyyMMdd_HHmmss').format(now);
    final String uniqueFileName = "Doc_$formattedDate$fileName";

    if (Platform.isAndroid) {
      final downloadsDir = await getExternalStorageDirectory();
      final filePath = "${downloadsDir!.path}/$uniqueFileName";

      File file = File(filePath);
      await file.writeAsBytes(bytes);

      return filePath;
    } else {
      print("❌ Not supported on this platform!");
      throw Exception("❌ Not supported on this platform!");
    }
  }

  Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      if (await Permission.manageExternalStorage.request().isGranted ||
          await Permission.storage.request().isGranted) {
        return true;
      }
    }
    return false;
  }

// إعلام النظام بوجود الملف حتى يظهر في تطبيق مدير الملفات
  void _notifyMediaScanner(String filePath) {
    if (Platform.isAndroid) {
      try {
        const platform = MethodChannel('com.example.client_project/files');
        platform.invokeMethod('scanFile', {"filePath": filePath});
      } catch (e) {
        print("❌ Error notifying system about file: $e");
        print("❌ خطأ أثناء إعلام النظام بوجود الملف: $e");
      }
    }
  }

  Future<Map<String, dynamic>> _fetchCustomerData() async {
    final User? user = _auth.currentUser;
    if (user == null) return {};

    // Assumes that each customer document's ID is the same as the user's UID.
    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();
    setState(() {
      _customerData = doc.data() ?? {};
    });

    return doc.data() ?? {};
  }

  Future<Uint8List> _generatePdf() async {
    // Fetch customer additional details from Firestore
    final customerData = await _fetchCustomerData();
    final String customerName = customerData["firstName"] ?? "Unknown Name";
    final String customerAddress = customerData["address"] ??
        widget.contract["address"] ??
        "Unknown Address";
    final String customerPhone =
        customerData["phone_number"] ?? "Unknown Phone";

    final pdf = pw.Document();

    final ByteData imageData = await rootBundle.load("assets/img/Group 1.png");
    final Uint8List imageBytes = imageData.buffer.asUint8List();

    // Extract contract/invoice details from widget
    String contractName = widget.contract["contract_name"] ?? 'No Name';
    String invoiceId =
        widget.contract["invoice"]?["invoice_id"] ?? 'Unknown Invoice ID';
    // You may choose to override the name with the fetched customer name if desired.
    String toName = customerName;
    // Use the customer address (if available) otherwise fallback to the contract address
    String address = customerAddress;
    int page_Count = widget.contract["invoice"]?["page_count"] ?? 0;
    String amount =
        widget.contract["invoice"]?["amount"]?.toString() ?? 'Unknown Amount';
    String date = DateTime.now().toString(); // Invoice date

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section with Logo and Invoice Title
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  // Company Logo
                  pw.Container(
                    width: 100,
                    height: 50,
                    decoration: pw.BoxDecoration(
                      image: pw.DecorationImage(
                        image: pw.MemoryImage(imageBytes),
                        fit: pw.BoxFit.contain,
                      ),
                    ),
                  ),
                  // Invoice Title
                  pw.Text(
                    'INVOICE',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Customer Details Section (fetched from Firestore)
              pw.Text(
                'Customer Information:',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Text('Name: $toName'),
              pw.Text('Address: $address'),
              pw.Text('Phone: $customerPhone'),
              pw.SizedBox(height: 20),

              // Invoice Details Section
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  // Billing Information
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Invoice Number: $invoiceId',
                        style: pw.TextStyle(fontSize: 12),
                      ),
                      pw.Text(
                        'Date: $date',
                        style: pw.TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  // Table Header
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                          'Description',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                          'Page Count',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                          'Price',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                          'Total',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Table Row for this invoice item (you can add more rows as needed)
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                          'Contract Review',
                          style: pw.TextStyle(fontSize: 12),
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                          '$page_Count',
                          style: pw.TextStyle(fontSize: 12),
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                          '\$$amount',
                          style: pw.TextStyle(fontSize: 12),
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                          '\$$amount',
                          style: pw.TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Total Amount Section
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'Total:',
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Text(
                    '\$$amount',
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Footer Section
              pw.Text(
                'Thank you for your business!',
                style: pw.TextStyle(
                  fontSize: 12,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<String> _uploadPdf(Uint8List pdfBytes) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('invoices/${widget.contract["contract_name"]}.pdf');
      await storageRef.putData(pdfBytes);
      return await storageRef.getDownloadURL();
    } catch (e) {
      print('Error uploading PDF: $e');
      Fluttertoast.showToast(msg: "Failed to upload PDF.");
      throw e;
    }
  }

  Future<void> _sendEmail(String recipientEmail, String pdfUrl) async {
    final smtpServer =
        gmail('ibrahimshafikinbox@gmail.com', 'bfjw psmt vzvh bdtt');

    final message = Message()
      ..from = Address('ibrahimshafikinbox@gmail.com', 'RYC_app')
      ..recipients.add(recipientEmail)
      ..subject = 'Your Invoice'
      ..text = 'Please find your invoice at the following link: $pdfUrl';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      Fluttertoast.showToast(msg: "Invoice link sent via email!");
    } on MailerException catch (e) {
      print('Message not sent. ${e.toString()}');
      Fluttertoast.showToast(msg: "Failed to send email.");
    }
  }

  Future<void> _onInvoiceClicked() async {
    setState(() {
      _isInvoiceLoading = true; // start loading
    });
    try {
      final User? user = _auth.currentUser;
      if (user == null || user.email == null) {
        _showErrorDialog("No user logged in.");
        return;
      }

      final String userEmail = user.email!;
      final pdfBytes = await _generatePdf();
      final pdfUrl = await _uploadPdf(pdfBytes);
      await _sendEmail(userEmail, pdfUrl);

      _showSuccessDialog("Invoice link sent via email!");
    } catch (e) {
      print('Error: $e');
      _showErrorDialog("An error occurred. Please try again.");
    } finally {
      setState(() {
        _isInvoiceLoading = false; // stop loading
      });
    }
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String contractName = widget.contract["contract_name"] ?? 'No Name';
    String status = widget.contract["status"] ?? 'Unknown';
    String invoiceId =
        widget.contract["invoice"]?["invoice_id"] ?? 'Unknown Invoice ID';
    String amount =
        widget.contract["invoice"]?["amount"]?.toString() ?? 'Unknown Amount';
    // String toName = widget.contract["company_name"] ?? 'Unknown Company/Person';
    // String address = widget.contract["address"] ?? 'Unknown Address';
    int pageCount = widget.contract["invoice"]?["page_count"] ?? 0;
    String toName = _customerData["firstName"] ?? "Unknown Name";
    String address = _customerData["address"] ??
        widget.contract["address"] ??
        "Unknown Address";

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Contract Details',
          style: AppTextStyle.textStyleBoldBlack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                contractName,
                style: AppTextStyle.textStyleBoldBlack,
              ),
            ),
            AppSizedBox.sizedH25,
            Center(
              child: Text(
                "Status: $status",
                style: AppTextStyle.textStyleBoldBlack,
              ),
            ),
            AppSizedBox.sizedH25,
            Text("Invoice Number: $invoiceId"),
            AppSizedBox.sizedH15,
            Text("To: $toName"),
            AppSizedBox.sizedH15,
            Text("Address: $address"),
            AppSizedBox.sizedH15,
            Text("Limited Contract Review: $pageCount Pages"),
            AppSizedBox.sizedH15,
            Row(
              children: [
                Text("Total"),
                Spacer(),
                Text(" \$ $amount"),
              ],
            ),
            AppSizedBox.sizedH50,
            appButtonWithIcon(
              function: _onInvoiceClicked,
              text: "Invoice",
              textColor: AppColors.black,
              bottonColor: AppColors.white,
              icon: Icons.navigate_next,
            ),
            if (_isInvoiceLoading) ...[
              SizedBox(height: 10),
              LinearProgressIndicator(
                color: AppColors.black,
              ),
            ],
            AppSizedBox.sizedH25,
            appButtonWithIcon(
              function: _downloadAndOpenFile,
              text: "Download Document",
              textColor: AppColors.black,
              bottonColor: AppColors.white,
              icon: Icons.download,
            ),
            AppSizedBox.sizedH10,
            if (_downloadProgress > 0 && _downloadProgress < 1) ...[
              LinearProgressIndicator(
                  color: AppColors.black, value: _downloadProgress),
              SizedBox(height: 10),
            ],
            AppSizedBox.sizedH100,
            DefaultButton(
              function: () {
                navigateAndFinish(context, ContractHomeView());
              },
              text:
                  "                            Home                            ",
              textColor: AppColors.white,
              bottonColor: AppColors.green,
            ),
          ],
        ),
      ),
    );
  }
}
