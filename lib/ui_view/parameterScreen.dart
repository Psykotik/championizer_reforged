import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ParameterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
      ),
      body: RaisedButton(
        onPressed: () {
          DefaultCacheManager manager = new DefaultCacheManager();
          manager.emptyCache(); //clears all data in cache.
        },
        child: const Text('Clear the cache', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
