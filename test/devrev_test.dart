import 'package:devrev/devrev.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("$DevRev", () {
    const MethodChannel channel = MethodChannel("devrev");

    final List<MethodCall> log = <MethodCall>[];

    late DevRev devrev;

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall call) async {
        log.add(call);
        if (call.method == "showSupport") {
          print("PLuG invoked");
          return null;
        }
        return {};
      });

      devrev = DevRev();
      log.clear();
    });

    group("#showSupport", () {

      test('PLuG Test', () async {

        await devrev.showSupport();

        expect(log, <Matcher>[isMethodCall('showSupport', arguments: {})]);
      });
    });
  });
}
