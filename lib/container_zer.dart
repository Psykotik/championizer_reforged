import 'package:flutter/material.dart';

class ContainerZer extends StatelessWidget {
  final String url;
  const ContainerZer({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Center(
          child: Image.network(
        url,
      )),
    );
  }
}
