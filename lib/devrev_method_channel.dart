import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'devrev_platform_interface.dart';

/// An implementation of [DevrevPlatform] that uses method channels.
class MethodChannelDevrev extends DevrevPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('devrev');

  @override
  Future<void> configure({required String appId}) async {
    await methodChannel.invokeMethod<void>('initializeDevRev', {"appId": appId});
  }

  @override
  Future<void> identifyUnverifiedUser({required String userId}) async {
    await methodChannel.invokeMethod<void>('identifyUnverifiedUser', {"userId": userId});
  }

  @override
  Future<void> identifyAnonymousUser({required String userId}) async {
    await methodChannel.invokeMethod<void>('identifyAnonymousUser', {"userId": userId});
  }

  @override
  Future<void> updateUser({required String userId}) async {
    await methodChannel.invokeMethod<void>('updateUser', {"userId": userId});
  }

  @override
  Future<void> trackEvent({required String name, required Map<String, String> properties}) async {
    await methodChannel.invokeMethod<void>('trackEvent', {"name": name, "properties": properties});
  }

  // Session analytics
  @override
  Future<void> startRecording() async {
    await methodChannel.invokeMethod<void>('startRecording');
  }
  @override
  Future<void> stopRecording() async {
    await methodChannel.invokeMethod<void>('stopRecording');
  }
  @override
  Future<void> pauseRecording() async {
    await methodChannel.invokeMethod<void>('pauseRecording');
  }
  @override
  Future<void> resumeRecording() async {
    await methodChannel.invokeMethod<void>('resumeRecording');
  }
}
