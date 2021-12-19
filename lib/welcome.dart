// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, prefer_typing_uninitialized_variables, no_logic_in_create_state, await_only_futures, unused_element, non_constant_identifier_names, unnecessary_null_comparison, avoid_print, prefer_adjacent_string_concatenation, sized_box_for_whitespace, unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/Database/database.dart';
import 'package:project/caraddimage.dart';
import 'package:project/carz.dart';
import 'package:project/model/admodel.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/caradd.dart';
import 'package:project/viewcar.dart';
import 'package:project/widgets/navigation_drawer_widget.dart';
import 'package:project/widgets/searchwidget.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late Database db;
  List docs = [];
  initialise() {
    db = Database();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value!;
          })
        });
  }

  UserModel um = UserModel();
  AdModel ad = AdModel();
  List cars = [];

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    initialise();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[800],
        child: Scaffold(
            drawer: NavigationDrawerWidget(um),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              actions: <Widget>[
                new IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SearchWidget();
                      }));
                    },
                    icon: Icon(Icons.search))
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              //color: Colors.black,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Caradd(userId: um.uid);
                }));
              },
              tooltip: 'Add Car',
              child: const Icon(Icons.car_rental),
            ),
            body: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 50,
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        ad.assembly = docs[index]['assembly'];
                        ad.bodtype = docs[index]['bodtype'];
                        ad.cartype = docs[index]['cartype'];
                        ad.city = docs[index]['city'];
                        ad.color = docs[index]['color'];
                        ad.contact = docs[index]['contact'];
                        ad.email = docs[index]['email'];
                        ad.enginecapacity = docs[index]['enginecapacity'];
                        ad.engineno = docs[index]['engineNo'];
                        ad.featured = docs[index]['featured'];
                        ad.fname = docs[index]['fname'];
                        ad.fueltype = docs[index]['fueltype'];
                        ad.kilometers = docs[index]['kilometers'];
                        ad.lname = docs[index]['lname'];
                        ad.make = docs[index]['make'];
                        ad.model = docs[index]['model'];
                        ad.price = docs[index]['price'];
                        ad.registered = docs[index]['registered'];
                        ad.transmission = docs[index]['transmission'];
                        ad.url = docs[index]['url'];
                        ad.version = docs[index]['version'];
                        ad.year = docs[index]['year'];
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ViewCar(ad: ad);
                        }));
                      },
                      child: Container(
                        color: Colors.black,
                        padding: EdgeInsets.only(right: 2, left: 20),
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 130,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  Text(
                                      docs[index]['make'] +
                                          ' ' +
                                          docs[index]['model'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal)),
                                  Text(
                                      'Engine: ' +
                                          docs[index]['enginecapacity'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal)),
                                  Text(
                                      'Kilometers: ' +
                                          docs[index]['kilometers'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal)),
                                  Text('Color: ' + docs[index]['color'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal)),
                                  Text('Price: ' + docs[index]['price'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.red[700],
                              radius: 45,
                              backgroundImage: NetworkImage(docs[index]['url']),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }

  _fetch() async {
    //FirebaseFirestore Firestore = FirebaseFirestore.instance;
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        um.email = ds['email'];
        um.uid = ds['uid'];
        um.fname = ds['firstname'];
        um.lname = ds['lastname'];
        um.nic = ds['nic'];
        um.contact = ds['contact'];
        print(um.email.toString());
      }).catchError((e) {
        print(e);
      });
    }
  }
}
