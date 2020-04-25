import 'package:cached_network_image/cached_network_image.dart';
import 'package:championizer_reforged/utils.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  final String url;
  const TestScreen({Key key, this.url}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
          GestureDetector(
            onTap: () {
              print("Clicked on 1st card");
            },
            child: Container(
              height: 120.0,
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              color: Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: new BorderRadius.only(
                        topRight: const Radius.circular(50.0),
                        bottomRight: const Radius.circular(5.0),
                      )),
                  child: Center(
                    child: Text("Hi modal sheet"),
                  )),
            ),
          ),
          Divider(),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    print("Clicked on 2nd card");
                  },
                  child: Container(
                    height: 120,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor("#03A9F4").withOpacity(0.6),
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor("#03A9F4"),
                            HexColor("#69ecfd"),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: const Radius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -15,
                right: -5,
                child: Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    color: HexColor("#FDF5E6").withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 15,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CachedNetworkImage(
                    imageUrl: "http://51.77.157.113/iconChampion.png",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    //placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                  top: 30,
                  left: 30,
                  child: Text(
                    "RANDOMIZE !",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 45,
                        color: HexColor("#FDF5E6")),
                  )),
              Positioned(
                  top: 75,
                  left: 32,
                  child: Text(
                    "Let the fate chose your LoL champion !",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: HexColor("#FDF5E6")),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
