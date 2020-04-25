import 'dart:core';
import 'package:championizer_reforged/ui_view/home.dart';
import 'package:championizer_reforged/ui_view/testScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:appcenter_crashes/appcenter_crashes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
  final ios = defaultTargetPlatform == TargetPlatform.iOS;

  var app_secret = ios ? "iOSGuid" : "AndroidGuid";
  await AppCenter.start(
      app_secret, [AppCenterAnalytics.id, AppCenterCrashes.id]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Championizer',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          splashColor: Colors.white10,
          appBarTheme: AppBarTheme(
            elevation: 0.0,
          )),
      home: MyHomePage(title: 'Championizer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Home());
  }
}
