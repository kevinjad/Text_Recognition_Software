import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
              child: Center(
            child: Text(
              'Developed by Kevin J.A.D\nNo Copyrights.\nI have provided the source.\nPlease feel free to edit and develop your own app.\n',
              textAlign: TextAlign.center,
            ),
          )),
          Container(
            child: InkWell(
              child: Text(
                'https://github.com/kevinjad/Text_Recognition_Software',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
              onTap: () async {
                if (await canLaunch(
                    'https://github.com/kevinjad/Text_Recognition_Software')) {
                  await launch(
                      'https://github.com/kevinjad/Text_Recognition_Software');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
