// ignore_for_file: file_names, must_be_immutable, no_logic_in_create_state, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowUpload extends StatefulWidget {
  String? userId;
  ShowUpload({Key? key, this.userId}) : super(key: key);

  @override
  _ShowUploadState createState() => _ShowUploadState(userId);
}

class _ShowUploadState extends State<ShowUpload> {
  String? userId;
  _ShowUploadState(this.userId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your images'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("carsz")
              .doc(widget.userId)
              .collection("images")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return (const Center(child: Text("No image uploaded")));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    String url = snapshot.data!.docs[index]['downloadURL'];
                    return Image.network(
                      url,
                      height: 300,
                      fit: BoxFit.cover,
                    );
                  });
            }
          },
        ));
  }
}
