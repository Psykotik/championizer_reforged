import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContainerZer extends StatefulWidget {
  final String url;
  const ContainerZer({Key key, this.url}) : super(key: key);

  @override
  _ContainerZerState createState() => _ContainerZerState();
}

class _ContainerZerState extends State<ContainerZer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              image: new DecorationImage(
                  image: new CachedNetworkImageProvider(widget.url))),
          /* child: Center(
            child: CachedNetworkImage(
              imageUrl: widget.url,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ), */
        ),
      ],
    );
  }
}
