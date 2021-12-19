// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, unused_import, avoid_print, must_be_immutable, use_key_in_widget_constructors, no_logic_in_create_state

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageUpload extends StatefulWidget {
  String? userId;
  ImageUpload({Key? key, this.userId}) : super(key: key);
  // ImageUpload({this.userId});
  @override
  _ImageUploadState createState() => _ImageUploadState(userId);
}

class _ImageUploadState extends State<ImageUpload> {
  //we need the user id to create a img folder
  String? userId;
  _ImageUploadState(this.userId);
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
        .child("${widget.userId}/images")
        .child("post_$postID");
    await ref.putFile(_image!);
    downloadURL = await ref.getDownloadURL();
    print(downloadURL);

    //uploading to cloud
    await firebaseFirestore
        .collection("carsz")
        .doc(widget.userId)
        .collection("images")
        .add({'downloadURL': downloadURL});
  }

  //snackbar for errors
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
      appBar: AppBar(
        title: Text('Add Image'),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(8),
            //for rounded rectangle clip
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: 550,
                width: double.infinity,
                child: Column(
                  children: [
                    const Text('Image Upload'),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: _image == null
                                    ? const Center(
                                        child: Text('No Image Selected'))
                                    : Image.file(_image!),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    imagepickerMethod();
                                  },
                                  child: Text('Select Image')),
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
                                  child: Text('Upload Image')),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
