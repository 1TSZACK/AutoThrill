// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, camel_case_types, no_logic_in_create_state, prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unnecessary_this, avoid_unnecessary_containers, unnecessary_new, avoid_print, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/caraddimage.dart';
import 'package:project/model/carmodel.dart';

class Caradd extends StatefulWidget {
  String? userId;
  Caradd({Key? key, this.userId}) : super(key: key);

  @override
  Caradd_State createState() => Caradd_State(userId);
}

class Caradd_State extends State<Caradd> {
  String? userId;
  Caradd_State(this.userId);

  TextEditingController engine_noController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController model_yearController = TextEditingController();
  TextEditingController model_makeController = TextEditingController();
  TextEditingController versionController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController transmissionController = TextEditingController();
  TextEditingController fuel_typeController = TextEditingController();
  TextEditingController kilometetrsController = TextEditingController();
  TextEditingController assemblyController = TextEditingController();
  TextEditingController body_typeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController engine_capacityController = TextEditingController();
  TextEditingController registeredController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController car_priceController = TextEditingController();

  String? registeredz;
  String? assemblyz;
  String? cartypez;
  String? bodytypez;
  String? fuletypez;
  String? transmissionz;

  String response = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final enginefield = TextFormField(
      controller: engine_noController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,6}$');
        if (value!.isEmpty) {
          return ("EngineNo cannot be Empty");
        }
        if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct EngineNo NUMBERS ONLY");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid EngineNo(6 Character)");
        }
        return null;
      },
      onSaved: (value) {
        engine_noController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Engine Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final yearfield = TextFormField(
      controller: model_yearController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,4}$');
        if (value!.isEmpty) {
          return ("Model Year cannot be Empty");
        }
        if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct Model Year NUMBERS ONLY");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Model Year(4 Character)");
        }
        return null;
      },
      onSaved: (value) {
        model_yearController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Model Year(YYYY)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final cityfield = TextFormField(
      controller: cityController,
      keyboardType: TextInputType.name,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("City cannot be Empty");
        }
        if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
          return ("Enter correct City ALBHABETS ONLY");
        }
        return null;
      },
      onSaved: (value) {
        cityController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "City",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final pricefield = TextFormField(
      controller: car_priceController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Price cannot be Empty");
        }
        if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct Price NUMBERS ONLY");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Price (Minimum 4 digits)");
        }
        return null;
      },
      onSaved: (value) {
        car_priceController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Price",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final colorfield = TextFormField(
      controller: colorController,
      keyboardType: TextInputType.name,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Color cannot be Empty");
        }
        if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
          return ("Enter correct color ALPHABETS ONLY");
        }
        return null;
      },
      onSaved: (value) {
        colorController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Color",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final modelfield = TextFormField(
      controller: modelController,
      keyboardType: TextInputType.name,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Model cannot be Empty");
        }
        if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
          return ("Enter correct Model ALPHABETS ONLY");
        }
        return null;
      },
      onSaved: (value) {
        modelController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Model",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final makefield = TextFormField(
      controller: model_makeController,
      keyboardType: TextInputType.name,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Model Make cannot be Empty");
        }
        if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
          return ("Enter correct Model Make ALPHABETS ONLY");
        }
        return null;
      },
      onSaved: (value) {
        model_makeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Model Make",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final versionfield = TextFormField(
      controller: versionController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        model_makeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Version(optional)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final kilometersfield = TextFormField(
      controller: kilometetrsController,
      keyboardType: TextInputType.number,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Kilometers cannot be Empty");
        }
        if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct Price NUMBERS ONLY");
        }
        return null;
      },
      onSaved: (value) {
        kilometetrsController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Kilometers",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final enginecapacityfield = TextFormField(
      controller: engine_capacityController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Enigne Capacity cannot be Empty");
        }
        if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct Engine Capacity NUMBERS ONLY");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Enigne Capacity (Minimum 3 digits)");
        }
        return null;
      },
      onSaved: (value) {
        engine_capacityController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Engine Capacity",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final registrationfield = Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: new Text('Registered YES/NO'),
        value: registeredz,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            this.registeredz = value;
          });
        },
        items: <String>[
          'Yes',
          'No',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
    final fuelfield = Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: new Text('Fuel Type'),
        value: fuletypez,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            this.fuletypez = value;
          });
        },
        items: <String>[
          'Petrol',
          'Diesel',
          'Hybrid',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
    final transmissionfield = Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: new Text('Transmission'),
        value: transmissionz,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            this.transmissionz = value;
          });
        },
        items: <String>[
          'Mannual',
          'Automatic',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
    final bodyfield = Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: new Text('Body Type'),
        value: bodytypez,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            this.bodytypez = value;
          });
        },
        items: <String>[
          'Sedan',
          'SUV',
          'Van',
          'Pickup',
          'Compact',
          'Coupe',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
    final cartypefield = Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: new Text('Car Type'),
        value: cartypez,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            this.cartypez = value;
          });
        },
        items: <String>[
          'New',
          'Old',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
    final assemblyfield = Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: new Text('Assembly'),
        value: assemblyz,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            this.assemblyz = value;
          });
        },
        items: <String>[
          'Local',
          'Imported',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );

    showSnackBar(String snackText, Duration d) {
      final snackBar = SnackBar(
        content: Text(snackText),
        duration: d,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Container(
      //alignment: Alignment.center,
      color: Colors.grey[800],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Car Details'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            // Container(
            //   alignment: Alignment.topCenter,
            //   padding: EdgeInsets.only(left: 85, top: 70),
            //   child: Text(
            //     'Create Account',
            //     style: TextStyle(color: Colors.white, fontSize: 33),
            //   ),
            // ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  //top: MediaQuery.of(context).size.height * 0.28),
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 5, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Step 1: Add Car Details',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            makefield,
                            SizedBox(
                              height: 30,
                            ),
                            modelfield,
                            SizedBox(
                              height: 30,
                            ),
                            versionfield,
                            SizedBox(
                              height: 30,
                            ),
                            yearfield,
                            SizedBox(
                              height: 30,
                            ),
                            enginefield,
                            SizedBox(
                              height: 30,
                            ),
                            cartypefield,
                            SizedBox(
                              height: 30,
                            ),
                            bodyfield,
                            SizedBox(
                              height: 30,
                            ),
                            registrationfield,
                            SizedBox(
                              height: 30,
                            ),
                            colorfield,
                            SizedBox(
                              height: 30,
                            ),
                            transmissionfield,
                            SizedBox(
                              height: 30,
                            ),
                            fuelfield,
                            SizedBox(
                              height: 30,
                            ),
                            enginecapacityfield,
                            SizedBox(
                              height: 30,
                            ),
                            kilometersfield,
                            SizedBox(
                              height: 30,
                            ),
                            assemblyfield,
                            SizedBox(
                              height: 30,
                            ),
                            cityfield,
                            SizedBox(
                              height: 30,
                            ),
                            pricefield,
                            SizedBox(
                              height: 40,
                            ),
                            MaterialButton(
                              minWidth: 200,
                              height: 60,
                              onPressed: () {
                                addc().whenComplete(() => showSnackBar(
                                    "Car Details Added Successfully:)",
                                    Duration(seconds: 2)));
                              },
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Add ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //Text('Check'),
                            //Text(response),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addc() async {
    if (_formKey.currentState!.validate()) {
      CarModel carModel = CarModel();

      carModel.engineno = engine_noController.text;
      carModel.model = modelController.text;
      carModel.make = model_makeController.text;
      carModel.year = model_yearController.text;
      carModel.color = colorController.text;
      carModel.price = car_priceController.text;
      carModel.city = cityController.text;
      carModel.enginecapacity = engine_capacityController.text;
      carModel.kilometers = kilometetrsController.text;
      carModel.version = versionController.text;
      carModel.assembly = assemblyz;
      carModel.bodtype = bodytypez;
      carModel.cartype = cartypez;
      carModel.fueltype = fuletypez;
      carModel.registered = registeredz;
      carModel.transmission = transmissionz;

      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      await firebaseFirestore
          .collection("cars")
          .doc(carModel.engineno)
          .set(carModel.toMap());

      print("Done Sir");
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(
              builder: (context) =>
                  addCarImage(engineNo: carModel.engineno, userId: userId)),
          (route) => false);
    }
  }
}
