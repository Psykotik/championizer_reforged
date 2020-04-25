import 'package:cached_network_image/cached_network_image.dart';
import 'package:championizer_reforged/data/championsImage.dart';
import 'package:championizer_reforged/ui_view/randomChampionImage.dart';
import 'package:championizer_reforged/utils.dart';
import 'package:flutter/material.dart';

class RandomChampion extends StatefulWidget {
  final String url;
  const RandomChampion({Key key, this.url}) : super(key: key);

  @override
  _RandomChampionState createState() => _RandomChampionState();
}

class _RandomChampionState extends State<RandomChampion> {
  String url =
      'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            'Championizer',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: <Widget>[
            Center(child: RandomChampionImage(url: url)),
            //SizedBox(height: 15),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32, right: 32, bottom: 8, top: 8),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xff03A9F4),
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
