import 'package:flutter/material.dart';
import 'dart:async';
import 'package:devrev/devrev.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _devrevPlugin = DevRev();

  @override
  void initState() {
    super.initState();
    initilizeDevRev();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initilizeDevRev() async {
    try {
      await _devrevPlugin.configure("don:core:dvrv-us-1:devo/0:plug_setting/1");
    } catch (e) {
      print("Failed to initialize DevRev SDK $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("DevRev Flutter Integration")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  // First, configure DevRev SDK
                  await _devrevPlugin.identifyUnverifiedUser("skroshan");
                  // After initialization, show the support screen
                  // await showSupport(platform);
                },
                child: Text("User identification"),
              ),
              ElevatedButton(
                onPressed: () async {
                  // First, configure DevRev SDK
                  await _devrevPlugin.showSupport();
                  // After initialization, show the support screen
                  // await showSupport(platform);
                },
                child: Text("Show Support"),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
