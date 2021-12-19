// ignore_for_file: file_names, no_logic_in_create_state, unnecessary_new, prefer_const_constructors, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:project/Database/searchdatabase.dart';
import 'package:project/model/admodel.dart';
import 'package:project/viewcar.dart';
import 'package:project/widgets/searchwidget.dart';

class ViewSearch extends StatefulWidget {
  String? model;
  String? make;
  ViewSearch({Key? key, this.model, this.make}) : super(key: key);

  @override
  _ViewSearchState createState() => _ViewSearchState(model, make);
}

class _ViewSearchState extends State<ViewSearch> {
  String? model;
  String? make;
  _ViewSearchState(this.model, this.make);
  late SearchDatabase db;
  AdModel ad = AdModel();
  List docs = [];
  initialise() {
    db = SearchDatabase();
    db.make = make;
    db.model = model;
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
            //drawer: NavigationDrawerWidget(um),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
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
}
