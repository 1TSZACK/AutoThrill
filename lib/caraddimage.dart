// ignore_for_file: camel_case_types, prefer_const_constructors, must_be_immutable, no_logic_in_create_state, avoid_print

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/addadvertise.dart';

class addCarImage extends StatefulWidget {
  String? engineNo;
  String? userId;
  addCarImage({Key? key, this.engineNo, this.userId}) : super(key: key);

  @override
  _addCarImageState createState() => _addCarImageState(engineNo, userId);
}

class _addCarImageState extends State<addCarImage> {
  String? userId;
  String? engineNo;
  _addCarImageState(this.engineNo, this.userId);

  File? _image;
  String? downloadURL;
  final imagePicker = ImagePicker();

  //image picker
  Future imagepickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        //showing snackbar
        showSnackBar("No file selected", Duration(milliseconds: 400));
      }
    });
  }

  //uploading the image then getting download url
  //then uploading the url to clord firebase

  Future uploadImage() async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${widget.engineNo}/images")
        .child("post_$postID");
    await ref.putFile(_image!);
    downloadURL = await ref.getDownloadURL();
    print(downloadURL);

    //uploading to cloud
    await firebaseFirestore
        .collection("cars")
        .doc(widget.engineNo)
        .collection("images")
        .doc(widget.engineNo)
        .set({'downloadURL': downloadURL});

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
            builder: (context) =>
                addAdvertise(engineNo: engineNo, userId: userId)),
        (route) => false);
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Image'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          color: Colors.grey[800],
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: 550,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    const Text('Step 2: Upload Car Image',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 30,
                            color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.red),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: _image == null
                                    ? const Center(
                                        child: Text('No Image Selected',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )))
                                    : Image.file(_image!),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  imagepickerMethod();
                                },
                                child: Text('Select Image'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_image != null) {
                                    uploadImage().whenComplete(() =>
                                        showSnackBar(
                                            "Image Uploaded Successfully:)",
                                            Duration(seconds: 2)));
                                  } else {
                                    showSnackBar("Select Image first",
                                        Duration(milliseconds: 400));
                                  }
                                },
                                child: Text('Upload Image'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
