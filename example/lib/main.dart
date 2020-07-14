import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:umeng_analytics_push/umeng_analytics_push.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var call = (custom) {
    print("收到@@@@@@@@@@ $custom");
  };

  UmengAnalyticsPush.addPushCustomMessageCallback((dynamic custom) => call(custom));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(),
      ),
    );
  }
}
