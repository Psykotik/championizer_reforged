import 'dart:core';
import 'package:championizer_reforged/ui_view/parameterScreen.dart';
import 'package:championizer_reforged/ui_view/randomChampionImage.dart';
import 'package:championizer_reforged/ui_view/testScren.dart';
import 'package:flutter/material.dart';
import 'package:championizer_reforged/data/championsImage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:championizer_reforged/style/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
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
  String url =
      'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Color(0x00000000),
            title: Text("Championizer"),
            actions: <Widget>[
              // action button
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SettingsOnePage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.settings_applications),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ParameterScreen()),
                  );
                },
              )
            ]),
        body: Column(
          children: <Widget>[
            Center(child: RandomChampionImage(url: url)),
            //SizedBox(height: 15),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 12,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: FlatButton(
                    child: Center(
                      child: Text(
                        'Get a new champion !',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        championsImageURLs.shuffle();
                        url = championsImageURLs.elementAt(0);
                      });
                      print("New champion : " + url);
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
