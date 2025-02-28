// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// class CacheHelper {
//   static late Directory _appDocDir;

//   static Future<void> init() async {
//     _appDocDir = await getApplicationDocumentsDirectory();
//   }

//   static Future<File> _getCacheFile(String fileName) async {
//     return File('${_appDocDir.path}/$fileName');
//   }

//   static Future<void> writeCacheData(String fileName, String data) async {
//     final file = await _getCacheFile(fileName);
//     await file.writeAsString(data);
//   }

//   static Future<String?> readCacheData(String fileName) async {
//     try {
//       final file = await _getCacheFile(fileName);
//       return await file.readAsString();
//     } catch (e) {
//       return null; // Return null if file not found
//     }
//   }

//   static Future<void> deleteCacheFile(String fileName) async {
//     final file = await _getCacheFile(fileName);
//     if (await file.exists()) {
//       await file.delete();
//     }
//   }
// }
import 'package:shared_preferences/shared_preferences.dart';

class CachePrfHelper {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save uid
  static Future<void> saveUid(String uid) async {
    await _preferences?.setString('uid', uid);
  }

  // Retrieve uid
  static String? getUid() {
    return _preferences?.getString('uid');
  }

  // Remove uid
  static Future<void> removeUid() async {
    await _preferences?.remove('uid');
  }
}
