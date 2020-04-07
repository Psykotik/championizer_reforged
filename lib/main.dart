import 'package:cached_network_image/cached_network_image.dart';
import 'package:championizer_reforged/container_zer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Championizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  List<String> urls = [
    'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg',
    'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Draven_0.jpg',
    'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Ezreal_0.jpg',
    'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/TahmKench_0.jpg',
  ];
  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Center(child: ContainerZer(url: url)),
        IconButton(
          icon: Icon(Icons.loop),
          tooltip: 'Get a new random champion !',
          onPressed: () {
            urls.shuffle();
            url = urls.elementAt(0);
            print(url);
          },
        )
      ],
    ));
  }

  List<Widget> _buildItems() {
    List<Widget> items = [];

    urls.forEach((String aUrl) {
      items.add(ContainerZer(url: aUrl));
    });

    return items;
  }
}
