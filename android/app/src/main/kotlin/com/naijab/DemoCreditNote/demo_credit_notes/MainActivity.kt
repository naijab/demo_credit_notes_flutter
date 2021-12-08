package com.naijab.DemoCreditNote.demo_credit_notes

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.naijab.DemoCreditNote.demo_credit_notes/version"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getNativeVersion") {
                val androidVersion = android.os.Build.VERSION.SDK_INT

                if (androidVersion != -1) {
                    result.success("19")
                } else {
                    result.error("UNAVAILABLE", "Android Version Not Available", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

}
