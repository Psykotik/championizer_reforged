import 'dart:core';
import 'package:championizer_reforged/container_zer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:championizer_reforged/data/championsImage.dart';

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
  String riotApiChampionUrl =
      'http://ddragon.leagueoflegends.com/cdn/10.7.1/data/en_US/champion.json';

  String riotApiResponse = "";

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/mock.json');
  }

  Future<List<Champion>> fetchChampionListFromAPI() async {
    final response = await http.get(riotApiChampionUrl);
    print(response.body);

    List responseJson = json.decode(response.body.toString());
    List<Champion> champList = createChampionList(responseJson);
    return champList;
  }

  void testFunction() {
    print(loadAsset());
    // var jsonData = champJson;
// var parsedJson = json.decode(jsonData);
// var user = User(parsedJson);
// print('${user.name} is ${user.alias}');
  }

  List<Champion> createChampionList(List data) {
    List<Champion> list = new List();
    for (int i = 0; i < data.length; i++) {
      String name = data[i]["name"];
      int id = data[i]["key"];
      String url = "url";
      Champion champ = new Champion(name: name, id: id, imageUrl: url);
      list.add(champ);
      print(champ);
    }
    return list;
  }
  
  String url =
      'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg';

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
            //fetchChampionListFromAPI();
            setState(() {
              championsImageURLs.shuffle();
              url = championsImageURLs.elementAt(0);
            });
            print(url);
          },
        ),
        IconButton(
          icon: Icon(Icons.cake),
          tooltip: 'Get a new random champion !',
          onPressed: () {
            testFunction();
          },
        )
      ],
    ));
  }
}

class Champion {
  String name;
  int id;
  String imageUrl;

  Champion({this.name, this.id, this.imageUrl});
}

class User {
  String name;
  String alias;
  User(Map<String, dynamic> data) {
    name = data['name'];
    alias = data['alias'];
  }
}
