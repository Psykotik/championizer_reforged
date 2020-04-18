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
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.70,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black,
                  blurRadius: 15.0,
                  spreadRadius: 5.0,
                ),
              ]
              /* image: new DecorationImage(
                  image: new CachedNetworkImageProvider(widget.url)) */
              ),
          child: Center(
            child: CachedNetworkImage(
              imageUrl: widget.url,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              //placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.02,
        )
      ],
    );
  }
}
