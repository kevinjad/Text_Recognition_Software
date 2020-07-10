import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import './RecTextScreen.dart';



class PhotoPicker extends StatefulWidget {
  final double availableHeight;
  final double availableWidth;
  PhotoPicker(this.availableHeight,this.availableWidth);
  @override
  _PhotoPickerState createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  File pickedImage;
  final TextRecognizer tr = FirebaseVision.instance.textRecognizer();
  var picker = ImagePicker();
  Future<void>pickImageFun() async {
    final PickedFile photo = await picker.getImage(source: ImageSource.camera);
    pickedImage = File(photo.path);
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);
    final VisionText textInImage = await tr.processImage(visionImage);
    await Navigator.push(context, MaterialPageRoute(builder: (ctx){return RecTextScreen(textInImage.text);}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.availableHeight,
        width: widget.availableWidth,
        child: IconButton(icon: Icon(Icons.camera_alt,color: Theme.of(context).accentColor,size: 50,), onPressed: (){pickImageFun();}),
      );
  }
}