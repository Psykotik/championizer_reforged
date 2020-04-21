import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RandomChampionImage extends StatefulWidget {
  final String url;
  const RandomChampionImage({Key key, this.url}) : super(key: key);

  @override
  _RandomChampionImageState createState() => _RandomChampionImageState();
}

class _RandomChampionImageState extends State<RandomChampionImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 12,
                  offset: const Offset(4, 4),
                  //spreadRadius: 5.0,
                ),
              ]),
          child: CachedNetworkImage(
            imageUrl: widget.url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            //placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.02,
        )
      ],
    );
  }
}
