import 'package:devrev/devrev.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("$DevRev", () {
    const MethodChannel channel = MethodChannel("devrev");

    final List<MethodCall> log = <MethodCall>[];

    late DevRev devrev;

    setUp(() async {
      channel.setMockMethodCallHandler((MethodCall call) async {
        log.add(call);
        if (call.method == "showSupport") {
          print("PLuG Simulated");
          return null;
        }
        return {};
      });

      devrev = DevRev();
      await devrev.configure("don:core:dvrv-us-1:devo/0:plug_setting/1");
      log.clear();
    });

    group("#showSupport", () {

      test('PLuG Test', () async {

        devrev.showSupport();

        expect(log, <Matcher>[isMethodCall('showSupport', arguments: {})]);
      });
    });
  });
}
