// ignore_for_file: must_be_immutable, no_logic_in_create_state, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project/model/admodel.dart';
import 'package:project/updatemycar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/welcome.dart';

class ViewUpdateMyCar extends StatefulWidget {
  AdModel ad;
  ViewUpdateMyCar({Key? key, required this.ad}) : super(key: key);

  @override
  _ViewUpdateMyCarState createState() => _ViewUpdateMyCarState(ad);
}

class _ViewUpdateMyCarState extends State<ViewUpdateMyCar> {
  AdModel ad;
  _ViewUpdateMyCarState(this.ad);

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            //color: Colors.redAccent[700],
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(ad.url.toString()),
              fit: BoxFit.contain,
            )),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              ad.make.toString() +
                  ' ' +
                  ad.model.toString() +
                  ' ' +
                  ad.version.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "constantia"),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                //color: Colors.redAccent[700],
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.speed, color: Colors.yellowAccent[700]),
                        Text(
                          "EngineCapacity: " + ad.enginecapacity.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.add_road_sharp, color: Colors.white),
                        Text(
                          "Kilometers: " + ad.kilometers.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.account_tree_outlined,
                          color: Colors.redAccent[700],
                        ),
                        Text(
                          "Transmission: " + ad.transmission.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        // Icon(Icons.directions_car),
                        Icon(
                          Icons.local_gas_station,
                          color: Colors.green,
                        ),
                        Text(
                          "Fuel Type: " + ad.fueltype.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.directions_car,
                          color: Colors.white,
                        ),
                        Text(
                          "Body Type: " + ad.bodtype.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          color: Colors.yellowAccent[700],
                        ),
                        Text(
                          "Condition: " + ad.cartype.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                //color: Colors.blueAccent[700],
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.blue[400],
                        ),
                        Text(
                          "Year: " + ad.year.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.colorize_outlined,
                          color: Colors.red[200],
                        ),
                        Text(
                          "Color: " + ad.color.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.stream_sharp,
                          color: Colors.lightBlue,
                        ),
                        Text(
                          "Registered: " + ad.registered.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red[900],
                        ),
                        Text(
                          "City: " + ad.city.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.car_repair,
                          color: Colors.white,
                        ),
                        Text(
                          "Assembly: " + ad.assembly.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.money_outlined,
                          color: Colors.green[700],
                        ),
                        Text(
                          "Price: " + ad.price.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                height: 50,
                minWidth: 150,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return UpdateMyCar(ad: ad);
                  }));
                },
                color: Colors.grey[700],
                elevation: 5,
                child: Text("Update", style: TextStyle(fontSize: 20)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                height: 50,
                minWidth: 150,
                onPressed: () {
                  deletemycar();
                },
                color: Colors.redAccent[700],
                elevation: 5,
                child: Text("Delete", style: TextStyle(fontSize: 20)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  deletemycar() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    await db.collection("advertise").doc(ad.adId).delete();

    FirebaseFirestore db2 = FirebaseFirestore.instance;

    await db2
        .collection("advertise")
        .doc(ad.adId)
        .collection("images")
        .doc(ad.engineno)
        .delete();

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection("cars").doc(ad.engineno).delete();

    showSnackBar("Car Deleted", Duration(milliseconds: 400));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Welcome();
    }));
  }
}
