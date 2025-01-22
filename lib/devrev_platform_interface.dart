import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'devrev_method_channel.dart';

abstract class DevrevPlatform extends PlatformInterface {
  /// Constructs a DevrevPlatform.
  DevrevPlatform() : super(token: _token);

  static final Object _token = Object();

  static DevrevPlatform _instance = MethodChannelDevrev();

  /// The default instance of [DevrevPlatform] to use.
  ///
  /// Defaults to [MethodChannelDevrev].
  static DevrevPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DevrevPlatform] when
  /// they register themselves.
  static set instance(DevrevPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> configure({required String appId}) {
    throw UnimplementedError('initializeDevRev() has not been implemented.');
  }
  Future<void> identifyUnverifiedUser({required String userId}) {
    throw UnimplementedError('identifyUnverifiedUser() has not been implemented.');
  }

  Future<void> identifyAnonymousUser({required String userId}) {
    throw UnimplementedError('identifyAnonymousUser() has not been implemented.');
  }

  Future<void> updateUser({required String userId}) {
    throw UnimplementedError('updateUser() has not been implemented.');
  }
  Future<void> showSupport() {
    throw UnimplementedError('showSupport() has not been implemented.');
  }
  Future<void> trackEvent({required String name, required Map<String, String> properties}) {
    throw UnimplementedError('trackEvent() has not been implemented.');
  }
  Future<void> startRecording() {
    throw UnimplementedError('trackEvent() has not been implemented.');
  }
  Future<void> stopRecording() {
    throw UnimplementedError('trackEvent() has not been implemented.');
  }
  Future<void> pauseRecording() {
    throw UnimplementedError('trackEvent() has not been implemented.');
  }
  Future<void> resumeRecording() {
    throw UnimplementedError('trackEvent() has not been implemented.');
  }
}
