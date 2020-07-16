import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:umeng_analytics_push/umeng_analytics_push.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var call = (custom) {
    print("收到@@@@@@@@@@ $custom");
  };

  UmengAnalyticsPush.addPushCustomMessageCallback(
      (dynamic custom) => call(custom));
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
          title: MaterialButton(
            child: Text('open push setting'),
            textColor: Colors.white,
            onPressed: () async {
              if (await UmengAnalyticsPush.isNotifyEnabled()) {
                print("已获取权限");
              } else {
                UmengAnalyticsPush.openPushSetting();
              }
            },
          ),
        ),
        body: Center(),
      ),
    );
  }
}
