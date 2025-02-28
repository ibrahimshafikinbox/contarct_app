import 'package:client_project/Feature/Contracts/cubit/contract_cubit.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import Fluttertoast
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:open_filex/open_filex.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LawyerContractDetails extends StatefulWidget {
  const LawyerContractDetails({
    super.key,
    required this.contract,
  });

  final Map<String, dynamic> contract;

  @override
  State<LawyerContractDetails> createState() => _LawyerContractDetailsState();
}

class _LawyerContractDetailsState extends State<LawyerContractDetails> {
  double _downloadProgress = 0.0; // Variable to track download progress
  bool _isDownloading = false; // Variable to track if the download is active

  Future<String?> downloadPdf(String url, String fileName) async {
    try {
      Dio dio = Dio();

      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath = '${appDocDir.path}/$fileName';

      setState(() {
        _isDownloading = true; // Show progress bar when downloading starts
        _downloadProgress = 0.0; // Reset progress
      });

      Fluttertoast.showToast(msg: "Download started..."); // Show toast

      // Start downloading the file
      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _downloadProgress = received / total; // Update progress
            });
            print(
                "Downloading: ${(received / total * 100).toStringAsFixed(0)}%");
          }
        },
      );

      Fluttertoast.showToast(msg: "Download completed!"); // Show toast

      setState(() {
        _isDownloading = false; // Hide progress bar when download is complete
      });

      print('File downloaded and saved at $savePath');
      return savePath; // Return file path after download
    } catch (e) {
      print('Error downloading file: $e');
      Fluttertoast.showToast(
          msg: "Error downloading file: $e"); // Show error toast
      setState(() {
        _isDownloading = false;
      });
      return null;
    }
  }

  Future<void> openPdfFile(String filePath) async {
    final result = await OpenFilex.open(filePath);

    // Check and print the result details
    print('File opened: ${result.type}');
    if (result.message != null) {
      print('Message: ${result.message}');
    }

    // Handle possible cases of file opening
    switch (result.type) {
      case ResultType.done:
        Fluttertoast.showToast(
            msg: "File opened successfully!"); // Show success toast
        print('File opened successfully!');
        break;
      case ResultType.error:
        Fluttertoast.showToast(msg: "Error opening file."); // Show error toast
        print('Error opening the file: ${result.message}');
        break;
      case ResultType.noAppToOpen:
        Fluttertoast.showToast(
            msg: "No app available to open the file."); // Show error toast
        print('No app available to open the file.');
        break;
      default:
        print('Unknown result: ${result.type}');
    }
  }

  @override
  Widget build(BuildContext context) {
    String contractName = widget.contract["contract_name"] ?? 'No Name';
    String status = widget.contract["status"] ?? 'Unknown';
    String invoiceId =
        widget.contract["invoice"]?["invoice_id"] ?? 'Unknown Invoice ID';
    String amount =
        widget.contract["invoice"]?["amount"]?.toString() ?? 'Unknown Amount';
    String toName = widget.contract["company_name"] ?? 'Unknown Company/Person';
    String address = widget.contract["address"] ?? 'Unknown Address';
    int pageCount = widget.contract["invoice"]?["page_count"] ?? 0;
    String fileUrl = widget.contract["contract_url"] ?? 'Unknown contract_url';
    String contract_id =
        widget.contract["contract_id"] ?? 'Unknown contract_url';

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Contract Details',
          style: AppTextStyle.textStyleBoldBlack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            AppSizedBox.sizedH25,

            // Button to show uploaded document (just a placeholder)
            appButtonWithIcon(
              function: () {},
              text: " Show Uploaded Document",
              textColor: AppColors.black,
              bottonColor: AppColors.white,
              icon: Icons.navigate_next,
            ),
            AppSizedBox.sizedH25,

            // Download button
            appButtonWithIcon(
              function: () async {
                String url = '$fileUrl';
                String fileName = 'sample.pdf'; // Local file name
                String? filePath = await downloadPdf(url, fileName);

                // Open the downloaded PDF file
                if (filePath != null) {
                  await openPdfFile(filePath);
                }
              },
              text: "Download Document",
              textColor: AppColors.black,
              bottonColor: AppColors.white,
              icon: Icons.navigate_next,
            ),

            // Show download progress bar if downloading
            if (_isDownloading)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: LinearProgressIndicator(
                  value: _downloadProgress,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
                ),
              ),

            AppSizedBox.sizedH20,
            appButtonWithIcon(
              function: () async {
                print(">>>>>>>>>>>>>>>>>>$contract_id");
                ContractCubit()
                    .uploadFileAndUpdateContract(contractId: contract_id);
              },
              text: "Upload Document again",
              textColor: AppColors.black,
              bottonColor: AppColors.white,
              icon: Icons.navigate_next,
            ),
            AppSizedBox.sizedH20,
            // Home button
            DefaultButton(
              function: () {
                Navigator.pop(context);
              },
              text: "Home",
              textColor: AppColors.white,
              bottonColor: AppColors.green,
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> uploadFile() async {
    try {
      // Use file picker to select only .doc and .docx files
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['doc', 'docx'],
      );

      if (result != null) {
        // Get the file path
        String? filePath = result.files.single.path;

        if (filePath != null) {
          File file = File(filePath);

          // Upload file to Firebase Storage
          String fileName = 'contracts/${result.files.single.name}';
          var storageRef = FirebaseStorage.instance.ref().child(fileName);

          // Upload the file and wait for completion
          UploadTask uploadTask = storageRef.putFile(file);
          TaskSnapshot snapshot = await uploadTask;

          // Get download URL after successful upload
          String downloadUrl = await snapshot.ref.getDownloadURL();
          return downloadUrl; // Return the file URL
        }
      } else {
        print('No file was selected');
        return null;
      }
    } catch (e) {
      print('Error during file upload: $e');
      return null;
    }
    return null;
  }

  // Future<String?> uploadFile() async {
  //   try {
  //     // Use file picker to select a file
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['doc', 'docx'],
  //     );

  //     if (result != null) {
  //       // Get the file path
  //       String? filePath = result.files.single.path;

  //       if (filePath != null) {
  //         File file = File(filePath);

  //         // Upload file to Firebase Storage
  //         String fileName = 'contracts/${result.files.single.name}';
  //         var storageRef = FirebaseStorage.instance.ref().child(fileName);

  //         // Upload the file and wait for completion
  //         UploadTask uploadTask = storageRef.putFile(file);
  //         TaskSnapshot snapshot = await uploadTask;

  //         // Get download URL after successful upload
  //         String downloadUrl = await snapshot.ref.getDownloadURL();
  //         return downloadUrl; // Return the file URL
  //       }
  //     } else {
  //       print('No file was selected');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error during file upload: $e');
  //     return null;
  //   }
  //   return null;
  // }
}
