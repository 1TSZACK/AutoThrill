// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/updateperson.dart';

class ViewPerson extends StatelessWidget {
  UserModel um;
  ViewPerson({Key? key, required this.um}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
          title: Text('Your Info'),
          backgroundColor: Colors.black,
          actions: <Widget>[
            new IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return UpdatePerson(um: um);
                  }));
                },
                icon: Icon(Icons.settings))
          ]),
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15,
            right: 35,
            left: 35),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child:
                  Text("Name", style: TextStyle(fontWeight: FontWeight.normal)),
            ),
            Container(
              width: 1000,
              height: 40,
              padding: EdgeInsets.all(10),
              child: Text(um.fname.toString() + ' ' + um.lname.toString(),
                  style: TextStyle(fontSize: 20)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text("Contact",
                  style: TextStyle(fontWeight: FontWeight.normal)),
            ),
            Container(
              width: 1000,
              height: 40,
              padding: EdgeInsets.all(10),
              child:
                  Text(um.contact.toString(), style: TextStyle(fontSize: 20)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child:
                  Text("NIC", style: TextStyle(fontWeight: FontWeight.normal)),
            ),
            Container(
              width: 1000,
              height: 40,
              padding: EdgeInsets.all(10),
              child: Text(um.nic.toString(), style: TextStyle(fontSize: 20)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Text("Email",
                  style: TextStyle(fontWeight: FontWeight.normal)),
            ),
            Container(
              width: 1000,
              height: 40,
              padding: EdgeInsets.all(10),
              child: Text(um.email.toString(), style: TextStyle(fontSize: 20)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            // MaterialButton(
            //   minWidth: 150,
            //   height: 40,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(50)),
            //   color: Colors.black,
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (context) {
            //       return UpdatePerson(um: um);
            //     }));
            //   },
            //   child: Text('Update Info', style: TextStyle(color: Colors.white)),
            // )
          ],
        ),
      ),
    );
  }
}
