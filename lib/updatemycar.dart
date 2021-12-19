// ignore_for_file: must_be_immutable, prefer_const_constructors, non_constant_identifier_names, unnecessary_new, unnecessary_this, prefer_const_literals_to_create_immutables, unused_element, no_logic_in_create_state, avoid_print

import 'package:flutter/material.dart';
import 'package:project/model/admodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/carmodel.dart';
import 'package:project/welcome.dart';

class UpdateMyCar extends StatefulWidget {
  AdModel ad;
  UpdateMyCar({Key? key, required this.ad}) : super(key: key);

  @override
  _UpdateMyCarState createState() => _UpdateMyCarState(ad);
}

class _UpdateMyCarState extends State<UpdateMyCar> {
  AdModel ad;
  _UpdateMyCarState(this.ad);
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
    final yearfield = TextFormField(
      controller: model_yearController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,4}$');
        if (value!.isEmpty) {
          //return ("Model Year cannot be Empty");
          model_yearController.text = ad.year!;
        } else if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct Model Year NUMBERS ONLY");
        } else if (!regex.hasMatch(value)) {
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
        hintText: ad.year,
        hintStyle: TextStyle(color: Colors.black),
        labelText: 'Year',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final cityfield = TextFormField(
      controller: cityController,
      keyboardType: TextInputType.name,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          //return ("City cannot be Empty");
          cityController.text = ad.city!;
        } else if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
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
        hintText: ad.city,
        hintStyle: TextStyle(color: Colors.black),
        labelText: "City",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final pricefield = TextFormField(
      controller: car_priceController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          //return ("Price cannot be Empty");
          car_priceController.text = ad.price!;
        } else if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct Price NUMBERS ONLY");
        } else if (!regex.hasMatch(value)) {
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
        hintText: ad.price,
        hintStyle: TextStyle(color: Colors.black),
        labelText: "Price",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final colorfield = TextFormField(
      controller: colorController,
      keyboardType: TextInputType.name,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          //return ("Color cannot be Empty");
          colorController.text = ad.color!;
        } else if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
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
        hintText: ad.color,
        hintStyle: TextStyle(color: Colors.black),
        labelText: "Color",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final modelfield = TextFormField(
      controller: modelController,
      keyboardType: TextInputType.name,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          //return ("Model cannot be Empty");
          modelController.text = ad.model!;
        } else if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
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
        hintText: ad.model,
        hintStyle: TextStyle(color: Colors.black),
        labelText: "Model",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final makefield = TextFormField(
      controller: model_makeController,
      keyboardType: TextInputType.name,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          //return ("Model Make cannot be Empty");
          model_makeController.text = ad.make!;
        } else if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
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
        hintText: ad.make,
        hintStyle: TextStyle(color: Colors.black),
        labelText: 'Model Make',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final versionfield = TextFormField(
      controller: versionController,
      keyboardType: TextInputType.name,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          //return ("Model Make cannot be Empty");
          versionController.text = ad.version!;
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
        hintText: ad.version,
        hintStyle: TextStyle(color: Colors.black),
        labelText: 'Version',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final kilometersfield = TextFormField(
      controller: kilometetrsController,
      keyboardType: TextInputType.number,
      validator: (value) {
        //RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          //return ("Kilometers cannot be Empty");
          kilometetrsController.text = ad.kilometers!;
        } else if (!RegExp(r'^[0-9]').hasMatch(value)) {
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
        hintText: ad.kilometers,
        hintStyle: TextStyle(color: Colors.black),
        labelText: 'Kilometers',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final enginecapacityfield = TextFormField(
      controller: engine_capacityController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          //return ("Enigne Capacity cannot be Empty");
          engine_capacityController.text = ad.enginecapacity!;
        } else if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct Engine Capacity NUMBERS ONLY");
        } else if (!regex.hasMatch(value)) {
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
        hintText: ad.enginecapacity,
        hintStyle: TextStyle(color: Colors.black),
        labelText: 'Engine Capacity',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
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
          title: Text('Step 1'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
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
                                    'Update Car Details',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 33),
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
                                updatecar().whenComplete(() => showSnackBar(
                                    "Car Details Added Successfully:)",
                                    Duration(seconds: 2)));
                              },
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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

  updatecar() async {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
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
      if (assemblyz != null) {
        carModel.assembly = assemblyz;
      } else {
        carModel.assembly = ad.assembly;
      }
      if (bodytypez != null) {
        carModel.bodtype = bodytypez;
      } else {
        carModel.bodtype = ad.bodtype;
      }
      if (cartypez != null) {
        carModel.cartype = cartypez;
      } else {
        carModel.cartype = ad.cartype;
      }
      if (fuletypez != null) {
        carModel.fueltype = fuletypez;
      } else {
        carModel.fueltype = ad.fueltype;
      }
      if (registeredz != null) {
        carModel.registered = registeredz;
      } else {
        carModel.registered = ad.registered;
      }
      if (transmissionz != null) {
        carModel.transmission = transmissionz;
      } else {
        carModel.transmission = ad.transmission;
      }

      await firebaseFirestore
          .collection('cars')
          .doc(ad.engineno)
          .set(carModel.toMap());

      print("Done Sir");
      Navigator.pushAndRemoveUntil((context),
          MaterialPageRoute(builder: (context) => Welcome()), (route) => false);
    }
  }
}
