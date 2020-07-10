import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:clipboard_manager/clipboard_manager.dart';

class RecTextScreen extends StatelessWidget {
  final String recText;
  RecTextScreen(this.recText);
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Recognized text'),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.content_copy),
            onPressed: () {
              /*ClipboardManager.copyToClipBoard(recText).then((result) {
                        final snackBar = SnackBar(
                          content: Text('Copied to Clipboard'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      });*/
              Clipboard.setData(ClipboardData(text: recText));
            })
      ],
    );
    /*final double availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;*/
    final double avaiilableWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              elevation: 4,
              child: Container(
                color: Colors.white,
                child: Center(
                    child: Text(
                  recText,
                  style: TextStyle(color: Colors.black),
                )),
                width: avaiilableWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
