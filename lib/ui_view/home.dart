import 'package:cached_network_image/cached_network_image.dart';
import 'package:championizer_reforged/ui_view/parameterScreen.dart';
import 'package:championizer_reforged/ui_view/randomChampion.dart';
import 'package:championizer_reforged/utils.dart';
import 'package:flutter/material.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';

class Home extends StatefulWidget {
  final String url;
  const Home({Key key, this.url}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                      builder: (context) => new ParameterScreen()),
                );
              },
            ),
            /* IconButton(
              icon: Icon(Icons.school),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new Home()),
                );
              },
            ), */
          ]),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new RandomChampion()),
              );
            },
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
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
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              await animated_dialog_box.showCustomAlertBox(
                  context: context,
                  firstButton: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.white,
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  yourWidget: Container(
                    child:
                        Text('This feature is not available yet ! Stay tuned.'),
                  ));
            },
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    height: 120,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor("#4CAF50").withOpacity(0.6),
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor("#4CAF50"),
                            HexColor("#CDDC39"),
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
                      imageUrl: "http://51.77.157.113/question.png",
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
                      "CHAMPIONS",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 45,
                          color: HexColor("#FDF5E6")),
                    )),
                Positioned(
                    top: 75,
                    left: 32,
                    child: Text(
                      "Discover the story of you favorite champion !",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: HexColor("#FDF5E6")),
                    ))
              ],
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              await animated_dialog_box.showCustomAlertBox(
                  context: context,
                  firstButton: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.white,
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  yourWidget: Container(
                    child:
                        Text('This feature is not available yet ! Stay tuned.'),
                  ));
            },
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    height: 120,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor("#FF5722").withOpacity(0.6),
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor("#FF5722"),
                            HexColor("#FFA000"),
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
                      imageUrl: "http://51.77.157.113/question.png",
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
                      "RANKING",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 45,
                          color: HexColor("#FDF5E6")),
                    )),
                Positioned(
                    top: 75,
                    left: 32,
                    child: Text(
                      "Let's see how good you are ! (or not)",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: HexColor("#FDF5E6")),
                    ))
              ],
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              await animated_dialog_box.showCustomAlertBox(
                  context: context,
                  firstButton: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.white,
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  yourWidget: Container(
                    child:
                        Text('This feature is not available yet ! Stay tuned.'),
                  ));
            },
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    height: 120,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor("#512DA8").withOpacity(0.6),
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor("#512DA8"),
                            HexColor("#FF4081"),
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
                      imageUrl: "http://51.77.157.113/question.png",
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
                      "??? ??",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 45,
                          color: HexColor("#FDF5E6")),
                    )),
                Positioned(
                    top: 75,
                    left: 32,
                    child: Text(
                      "??? ?? ???? ???? ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: HexColor("#FDF5E6")),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
