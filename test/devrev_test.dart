import 'package:flutter_test/flutter_test.dart';
import 'package:devrev/devrev.dart';
import 'package:devrev/devrev_platform_interface.dart';
import 'package:devrev/devrev_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDevrevPlatform
    with MockPlatformInterfaceMixin
    implements DevrevPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DevrevPlatform initialPlatform = DevrevPlatform.instance;

  test('$MethodChannelDevrev is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDevrev>());
  });

  test('getPlatformVersion', () async {
    DevRev devrevPlugin = DevRev();
    MockDevrevPlatform fakePlatform = MockDevrevPlatform();
    DevrevPlatform.instance = fakePlatform;

    expect(await devrevPlugin.getPlatformVersion(), '42');
  });
}
