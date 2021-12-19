// ignore_for_file: no_logic_in_create_state, prefer_const_constructors, camel_case_types, unnecessary_this, unnecessary_new, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/welcome.dart';

class addAdvertise extends StatefulWidget {
  String? engineNo;
  String? userId;
  addAdvertise({Key? key, this.engineNo, this.userId}) : super(key: key);

  @override
  _addAdvertiseState createState() => _addAdvertiseState(engineNo, userId);
}

class _addAdvertiseState extends State<addAdvertise> {
  String? engineNo;
  String? userId;
  _addAdvertiseState(this.engineNo, this.userId);

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //TextEditingController featuredController = TextEditingController();
  String? featuredz;

  @override
  Widget build(BuildContext context) {
    final featured = Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: new Text('Select the amount for Featuring AD'),
        value: featuredz,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            this.featuredz = value;
          });
        },
        items: <String>['0', '3000', '5000']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text("Advertise"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          //margin: EdgeInsets.only(left: 135, top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Step 3: Advertise',
                  style: TextStyle(color: Colors.white, fontSize: 33)),
              SizedBox(
                height: 30,
              ),
              featured,
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  postadvertise();
                },
                minWidth: 200,
                height: 60,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Post AD",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                "Disclaimer: Higher the amount for feturing your AD the more higher your AD comes!!",
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postadvertise() async {
    if (featuredz != null) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      await firebaseFirestore.collection("advertise").add(
          {'userId': userId, 'engineNo': engineNo, 'featuredprice': featuredz});
      showSnackBar("Advertise Added", Duration(milliseconds: 400));

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Welcome()));
    } else {
      showSnackBar("Please Select featured price", Duration(milliseconds: 400));
    }
  }
}
