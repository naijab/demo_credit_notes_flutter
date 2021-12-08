import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let flutterChannel = FlutterMethodChannel(name: "com.naijab.DemoCreditNote.demo_credit_notes/version",
                                              binaryMessenger: controller.binaryMessenger)
    flutterChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

      guard call.method == "getNativeVersion" else {
        result(FlutterMethodNotImplemented)
        return
      }
      
      result(UIDevice.current.systemVersion)
    })


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
