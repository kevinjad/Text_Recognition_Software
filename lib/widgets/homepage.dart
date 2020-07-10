import './photo_picker.dart';
import 'package:flutter/material.dart';
import './infoScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Text Recognition Software'),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return InfoScreen();
              }));
            })
      ],
    );

    double availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;
    double availableWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar,
      body: PhotoPicker(availableHeight, availableWidth),
    );
  }
}
