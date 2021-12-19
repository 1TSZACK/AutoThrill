// ignore_for_file: no_logic_in_create_state, must_be_immutable, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:project/model/admodel.dart';

class ViewCar extends StatefulWidget {
  AdModel ad;
  ViewCar({Key? key, required this.ad}) : super(key: key);

  @override
  _ViewCarState createState() => _ViewCarState(ad);
}

class _ViewCarState extends State<ViewCar> {
  AdModel ad;
  _ViewCarState(this.ad);
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
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Text("For more information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                    Text(
                      "Contact: " + ad.contact.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mail_outline_outlined,
                      color: Colors.blue,
                    ),
                    Text(
                      "Email: " + ad.email.toString(),
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
    );
  }
}
