// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:path_provider/path_provider.dart';

// class FileHelper {
//   static Future<String?> downloadPdf(
//       String url, String fileName, Function(double) onProgress) async {
//     try {
//       Dio dio = Dio();
//       Directory appDocDir = await getApplicationDocumentsDirectory();
//       String savePath = '${appDocDir.path}/$fileName';

//       // Start downloading and track progress
//       await dio.download(
//         url,
//         savePath,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             onProgress(received / total);
//           }
//         },
//       );

//       Fluttertoast.showToast(msg: "Download completed!");
//       return savePath;
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error downloading file: $e");
//       return null;
//     }
//   }

//   static Future<void> openPdfFile(String filePath) async {
//     final result = await OpenFilex.open(filePath);
//     switch (result.type) {
//       case ResultType.done:
//         Fluttertoast.showToast(msg: "File opened successfully!");
//         break;
//       case ResultType.error:
//         Fluttertoast.showToast(msg: "Error opening file.");
//         break;
//       case ResultType.noAppToOpen:
//         Fluttertoast.showToast(msg: "No app available to open the file.");
//         break;
//       default:
//         break;
//     }
//   }

//   static Future<String?> uploadFileToFirebase() async {
//     try {
//       FilePickerResult? result =
//           await FilePicker.platform.pickFiles(type: FileType.any);

//       if (result != null && result.files.single.path != null) {
//         File file = File(result.files.single.path!);
//         String fileName = 'contracts/${result.files.single.name}';
//         var storageRef = FirebaseStorage.instance.ref().child(fileName);
//         UploadTask uploadTask = storageRef.putFile(file);
//         TaskSnapshot snapshot = await uploadTask;

//         // Get download URL after successful upload
//         return await snapshot.ref.getDownloadURL();
//       } else {
//         print('No file was selected');
//         return null;
//       }
//     } catch (e) {
//       print('Error during file upload: $e');
//       return null;
//     }
//   }
// }
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

// class FileHelper {
//   /// Downloads a file and returns the file path
//   static Future<String?> downloadFile(
//       String url, String fileName, Function(double) onProgress) async {
//     try {
//       Dio dio = Dio();
//       Directory appDocDir = await getApplicationDocumentsDirectory();
//       String savePath = '${appDocDir.path}/$fileName';

//       // Start downloading and track progress
//       await dio.download(
//         url,
//         savePath,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             onProgress(received / total);
//           }
//         },
//       );

//       Fluttertoast.showToast(msg: "Download completed!");
//       return savePath;
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error downloading file: $e");
//       return null;
//     }
//   }

//   /// Opens a file based on its type
//   static Future<void> openFile(String filePath) async {
//     File file = File(filePath);

//     if (await file.exists()) {
//       final result = await OpenFilex.open(filePath);

//       switch (result.type) {
//         case ResultType.done:
//           Fluttertoast.showToast(msg: "File opened successfully!");
//           break;
//         case ResultType.error:
//           Fluttertoast.showToast(msg: "Error opening file.");
//           break;
//         case ResultType.noAppToOpen:
//           Fluttertoast.showToast(msg: "No app available to open this file.");
//           break;
//         default:
//           break;
//       }
//     } else {
//       Fluttertoast.showToast(msg: "File not found on the device.");
//     }
//   }

//   /// Uploads a file to Firebase and returns the file URL
//   static Future<String?> uploadFileToFirebase() async {
//     try {
//       FilePickerResult? result =
//           await FilePicker.platform.pickFiles(type: FileType.any);

//       if (result != null && result.files.single.path != null) {
//         File file = File(result.files.single.path!);
//         String fileName = 'contracts/${result.files.single.name}';
//         var storageRef = FirebaseStorage.instance.ref().child(fileName);
//         UploadTask uploadTask = storageRef.putFile(file);
//         TaskSnapshot snapshot = await uploadTask;

//         // Get download URL after successful upload
//         return await snapshot.ref.getDownloadURL();
//       } else {
//         print('No file was selected');
//         return null;
//       }
//     } catch (e) {
//       print('Error during file upload: $e');
//       return null;
//     }
//   }
// }
class FileHelper {
  /// Downloads a file and returns the file path
  static Future<String?> downloadFile(
      String url, String savePath, Function(double) onProgress) async {
    try {
      Dio dio = Dio();

      // Start downloading and track progress
      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            onProgress(received / total);
          }
        },
      );

      Fluttertoast.showToast(msg: "Download completed!");
      return savePath;
    } catch (e) {
      Fluttertoast.showToast(msg: "Error downloading file: $e");
      return null;
    }
  }

  /// Opens a file based on its type
  static Future<void> openFile(String filePath) async {
    File file = File(filePath);

    if (await file.exists()) {
      final result = await OpenFilex.open(filePath);

      switch (result.type) {
        case ResultType.done:
          Fluttertoast.showToast(msg: "File opened successfully!");
          break;
        case ResultType.error:
          Fluttertoast.showToast(msg: "Error opening file.");
          break;
        case ResultType.noAppToOpen:
          Fluttertoast.showToast(msg: "No app available to open this file.");
          break;
        default:
          break;
      }
    } else {
      Fluttertoast.showToast(msg: "File not found on the device.");
    }
  }

  /// Uploads a file to Firebase and returns the file URL
  static Future<String?> uploadFileToFirebase() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.any);

      if (result != null && result.files.single.path != null) {
        File file = File(result.files.single.path!);
        String fileName = 'contracts/${result.files.single.name}';
        var storageRef = FirebaseStorage.instance.ref().child(fileName);
        UploadTask uploadTask = storageRef.putFile(file);
        TaskSnapshot snapshot = await uploadTask;

        // Get download URL after successful upload
        return await snapshot.ref.getDownloadURL();
      } else {
        print('No file was selected');
        return null;
      }
    } catch (e) {
      print('Error during file upload: $e');
      return null;
    }
  }
}
