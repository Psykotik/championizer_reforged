import 'package:flutter/material.dart';

class LicenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            'Language',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                  'https://github.com/Shubham-Narkhede/animated_dialog_box/blob/master/animated_box_example/lib/main.dart'),
            ),
            ListTile(
              title: Text(
                  'https://github.com/lohanidamodar/flutter_ui_challenges'),
            ),
          ],
        ));
  }
}
