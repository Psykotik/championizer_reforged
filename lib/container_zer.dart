import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContainerZer extends StatelessWidget {
  final String url;
  const ContainerZer({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Center(
            child: CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }
}
