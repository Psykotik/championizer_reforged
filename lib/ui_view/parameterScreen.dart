import 'package:championizer_reforged/ui_view/settings/languages.dart';
import 'package:championizer_reforged/ui_view/settings/licences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:championizer_reforged/style/colorUI.dart';

class ParameterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "General Settings",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03A9F4),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.cached,
                          color: Color(0xff03A9F4),
                        ),
                        title: Text("Clear Cache"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () async {
                          DefaultCacheManager manager =
                              new DefaultCacheManager();
                          manager.emptyCache(); //clears all data in cache.
                          print("Cache cleared");
                          await animated_dialog_box.showCustomAlertBox(
                              context: ctxt,
                              firstButton: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                color: Colors.white,
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(ctxt).pop();
                                },
                              ),
                              yourWidget: Container(
                                child: Text('The cache has been cleared'),
                              ));
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.language,
                          color: Color(0xff03A9F4),
                        ),
                        title: Text("Change Language"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            ctxt,
                            new MaterialPageRoute(
                                builder: (context) => new LanguageScreen()),
                          );
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.rate_review,
                          color: Color(0xff03A9F4),
                        ),
                        title: Text("Review the app"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: null,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Other Settings",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03A9F4),
                  ),
                ),
                SwitchListTile(
                  activeColor: Color(0xff03A9F4),
                  value: false,
                  title: Text("Dark mode"),
                  onChanged: null,
                ),
                ListTile(
                  title: Text("Report / Suggestions"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    _launchMail();
                  },
                ),
                ListTile(
                  title: Text("Github"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    _launchGithub();
                  },
                ),
                ListTile(
                  title: Text("Licences"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (context) => new LicenceScreen()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Version"),
                  trailing: Text("Alpha",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.grey)),
                  onTap: null,
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60,
                //color: Colors.black,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text("Built with Flutter",
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.grey,
                          )),
                      Text("Developped by Jordan Lambert, 2020",
                          style: TextStyle(
                              fontWeight: FontWeight.w200, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Container _buildDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    width: double.infinity,
    height: 1.0,
    color: Colors.grey.shade400,
  );
}

_launchMail() async {
  final String subject = "Championizer Report / Suggestion";
  final String stringText = "\n\n\nVersion : Alpha";

  String uri =
      'mailto:dev.jordanlambert@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(stringText)}';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

_launchGithub() async {
  const url = 'https://github.com/Psykotik/championizer_reforged';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
