import 'package:flutter/material.dart';

String urlG = '';

class ShowImage extends StatefulWidget {
  ShowImage(String url, {Key? key}) : super(key: key) {
    urlG = url;
  }

  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.network(urlG)),
    );
  }
}
