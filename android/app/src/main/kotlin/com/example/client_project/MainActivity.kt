// package com.example.client_project

// import io.flutter.embedding.android.FlutterActivity

// import io.flutter.embedding.android.FlutterFragmentActivity

// class MainActivity: FlutterFragmentActivity() {
// }
package com.example.client_project

import android.media.MediaScannerConnection
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "com.example.client_project/files"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "scanFile") {
                val filePath = call.argument<String>("filePath")
                if (filePath != null) {
                    scanFile(filePath, result)
                } else {
                    result.error("INVALID_ARGUMENT", "File path is null", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun scanFile(filePath: String, result: MethodChannel.Result) {
        MediaScannerConnection.scanFile(
            this,
            arrayOf(filePath),
            null
        ) { path, uri ->
            if (uri != null) {
                result.success("✅ Scanned: $path")
            } else {
                result.error("SCAN_FAILED", "❌ Failed to scan file", null)
            }
        }
    }
}
