// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("About US"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 100, right: 100),
            // child: Text("AUTO THRILL",
            //     style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/at.jpeg"),
              fit: BoxFit.cover,
            )),
          ),
          Text("Made By", style: TextStyle(color: Colors.white, fontSize: 25)),
          Text("Ahmed Saeed",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Text("Muhammad Zahid",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Text("Muhammad Zayyan",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    );
  }
}
