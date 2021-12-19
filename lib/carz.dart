// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:project/imageupload/imageupload.dart';
import 'package:project/imageupload/showimages..dart';

class Carz extends StatefulWidget {
  String? userz;
  Carz({Key? key, this.userz}) : super(key: key);
  //Carz({this.userz});
  @override
  _CarzState createState() => _CarzState(userz!);
}

class _CarzState extends State<Carz> {
  String userz;
  _CarzState(this.userz);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CAR IMAGE'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ImageUpload(userId: userz);
                    }));
                  },
                  child: Text('Upload Image')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowUpload(userId: userz)));
                  },
                  child: Text('Select Image')),
            ],
          ),
        ),
      ),
    );
  }
}
