package com.roshan.devrev

import ai.devrev.sdk.DevRev
import ai.devrev.sdk.model.Identity
import ai.devrev.sdk.showSupport
import ai.devrev.sdk.trackEvent
import androidx.annotation.NonNull
import android.content.Context
import android.se.omapi.Session
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DevrevPlugin */
class DevrevPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
//  private var activity: Activity? = null
  private var context: Context? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "devrev")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "initializeDevRev") {
      val appId = call.argument<String>("appId")
      DevRev.configure(
        context = context!!,
        appId = appId!!
      )
    } else if (call.method == "identifyUnverifiedUser") {
      val userId = call.argument<String>("userId")
      DevRev.identifyUnverifiedUser(identity = Identity(userId!!))
    } else if (call.method == "identifyAnonymousUser") {
      val userId = call.argument<String>("userId")
      DevRev.identifyAnonymousUser(
          userId = userId
      )
    } else if (call.method == "showSupport") {
      DevRev.showSupport(context!!)
    } else if (call.method == "trackEvent") {
      val name = call.argument<String>("name")
      val properties = call.argument<HashMap<String, String>>("properties")
      DevRev.trackEvent(name = name, properties = properties)
    } else if (call.method =="startRecording") {
      SessionAnalytics().startRecording(context = context!!);
    } else if (call.method == "stopRecording") {
      SessionAnalytics().stopRecording()
    } else if (call.method == "pauseRecording") {
      SessionAnalytics().pauseRecording()
    } else if (call.method == "resumeRecording") {
      SessionAnalytics().resumeRecording()
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
