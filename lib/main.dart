import 'dart:core';
import 'package:championizer_reforged/container_zer.dart';
import 'package:flutter/material.dart';
import 'package:championizer_reforged/data/championsImage.dart';
import 'package:flutter/services.dart';

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
  @override
  String url =
      'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg';
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
                onPressed: () {},
              )
            ]),
        body: Column(
          children: <Widget>[
            Center(child: ContainerZer(url: url)),
            RaisedButton(
              onPressed: () {
                setState(() {
                  championsImageURLs.shuffle();
                  url = championsImageURLs.elementAt(0);
                });
                print(url);
              },
              child: const Text('Explore the rift !',
                  style: TextStyle(fontSize: 20)),
            ),
          ],
        ));
  }
}
