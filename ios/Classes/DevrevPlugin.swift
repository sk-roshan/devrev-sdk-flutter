import Flutter
import UIKit
import DevRevSDK
import SessionAnalytics
  
public class DevrevPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "devrev", binaryMessenger: registrar.messenger())
    let instance = DevrevPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case "initializeDevRev":
            if let args = call.arguments as? [String: Any],
               let appId = args["appId"] as? String {
                // Pass the API key to the DevRevSDK
                DevRev.configure(appID: appId)
                result("DevRev initialized with API key: \(appId)")
            } else {
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing or invalid arguments", details: nil))
            }
        case "identifyUnverifiedUser":
            Task {
                    do {
                        if let args = call.arguments as? [String: Any],
                            let userId = args["userId"] as? String {
                            try await DevRev.identifyUnverifiedUser(Identity(userID: userId))
                            result("User identified with ID: \(userId)")
                        } else {
                            result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing or invalid arguments", details: nil))
                        }
                    } catch {
                        result(FlutterError(code: "SHOW_SUPPORT_ERROR", message: "Failed to show support", details: error.localizedDescription))
                    }
                }
        case "identifyAnonymousUser":
            Task {
                do {
                    if let userId = call.arguments as? String {
                        try await DevRev.identifyAnonymousUser(Identity(userID: userId))
                        result("User identified with ID: \(userId)")
                    } else {
                        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing or invalid arguments", details: nil))
                    }
                } catch {
                    result(FlutterError(code: "SHOW_SUPPORT_ERROR", message: "Failed to show support", details: error.localizedDescription))
                }
            }
        case "showSupport":
            Task {
                do {
                    try await DevRev.showSupport()
                    result("Support screen shown")
                } catch {
                    result(FlutterError(code: "SHOW_SUPPORT_ERROR", message: "Failed to show support", details: error.localizedDescription))
                }
            }
        case "trackEvent":
            Task {
                do {
                    // capture name: string and properties: Map
                    if let args = call.arguments as? [String: Any],
                        let name = args["name"] as? String,
                        let properties = args["properties"] as? [String: Any] {
                        try await DevRev.trackEvent(name: name, properties: properties)
                        result("Event tracked with name: \(name) and properties: \(properties)")
                    } else {
                        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing or invalid arguments", details: nil))
                    }
                }
            }
        case "startRecording":
            SessionAnalytics().startRecording()
        case "stopRecording":
            SessionAnalytics().stopRecording()
        case "pauseRecording":
            SessionAnalytics().pauseRecording()
        case "resumeRecording":
            SessionAnalytics().resumeRecording()
        default:
            result(FlutterMethodNotImplemented)
        }
  }
}
