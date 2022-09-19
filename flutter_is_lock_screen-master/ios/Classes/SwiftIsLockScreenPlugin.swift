import Flutter
import UIKit

public class SwiftIsLockScreenPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "is_lock_screen", binaryMessenger: registrar.messenger())
        let instance = SwiftIsLockScreenPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch (call.method) {
        case "isLockScreen":
//            return result(UIScreen.main.brightness == 0.0)
            let state = UIApplication.shared.applicationState
            if (state == .active){
                print("Application state active")
                return result(false)
            }else if (state == .background){
                print("Application state background")
                return result(true)
            } else {
                print("Application state inactive")
                return result(true)
            }
        default:
            return result(FlutterMethodNotImplemented)
        }
    }
}
