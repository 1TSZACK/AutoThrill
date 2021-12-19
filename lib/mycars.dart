// ignore_for_file: no_logic_in_create_state, must_be_immutable, prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:project/Database/mycardatabase.dart';
import 'package:project/model/admodel.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/viewmycar.dart';
import 'package:project/widgets/navigation_drawer_widget.dart';

class MyCar extends StatefulWidget {
  UserModel um;
  MyCar({Key? key, required this.um}) : super(key: key);

  @override
  _MyCarState createState() => _MyCarState(um);
}

class _MyCarState extends State<MyCar> {
  UserModel um;
  AdModel ad = AdModel();
  _MyCarState(this.um);
  late MyCarDatabase db;
  List docs = [];
  initialise() {
    db = MyCarDatabase();
    db.zid = um.uid;
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value!;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[800],
        child: Scaffold(
            drawer: NavigationDrawerWidget(um),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("My Cars"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 50,
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        ad.adId = docs[index]['adId'];
                        print(ad.adId);
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
                          return ViewUpdateMyCar(ad: ad);
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
}
