
import 'devrev_platform_interface.dart';

class DevRev {

  // Configuration
  Future<void> configure(String appId) {
    return DevrevPlatform.instance.configure(appId: appId);
  }

  // Authentication
  Future<void> identifyUnverifiedUser(String userId) {
    return DevrevPlatform.instance.identifyUnverifiedUser(userId: userId);
  }

  Future<void> identifyAnonymousUser(String userId) {
    return DevrevPlatform.instance.identifyAnonymousUser(userId: userId);
  }

  Future<void> updateUser(String userId) {
    return DevrevPlatform.instance.identifyAnonymousUser(userId: userId);
  }

  // PLuG support Chat
  Future<void> showSupport() {
    return DevrevPlatform.instance.showSupport();
  }

  // Analytics
  Future<void> trackEvent(String name, Map<String, String> properties) {
    return DevrevPlatform.instance.trackEvent(name: name, properties:  properties);
  }

  // Session Analytics
  Future<void> startRecording() {
    return DevrevPlatform.instance.startRecording();
  }

  Future<void> stopRecording() {
    return DevrevPlatform.instance.stopRecording();
  }

  Future<void> pauseRecording() {
    return DevrevPlatform.instance.pauseRecording();
  }

  Future<void> resumeRecording() {
    return DevrevPlatform.instance.resumeRecording();
  }
}
