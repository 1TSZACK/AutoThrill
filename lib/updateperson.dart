// ignore_for_file: must_be_immutable, no_logic_in_create_state, prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:project/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/welcome.dart';

class UpdatePerson extends StatefulWidget {
  UserModel um;
  UpdatePerson({Key? key, required this.um}) : super(key: key);

  @override
  _UpdatePersonState createState() => _UpdatePersonState(um);
}

class _UpdatePersonState extends State<UpdatePerson> {
  UserModel um;
  _UpdatePersonState(this.um);
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final fnamefield = TextFormField(
      autofocus: false,
      controller: fnameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          //return ("First Name cannot be Empty");
          fnameController.text = um.fname!;
        } else if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
          return ("Enter correct Last Name ALBHABETS ONLY");
        } else if (!regex.hasMatch(value)) {
          return ("Enter Valid First Name(Min 2 Character)");
        }
        return null;
      },
      onSaved: (value) {
        fnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.account_circle),
        fillColor: Colors.grey[100],
        focusColor: Colors.black,
        filled: true,
        hintText: um.fname,
        hintStyle: TextStyle(color: Colors.black),
        labelText: 'First Name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: BorderSide(color: Colors.black)),
        // enabledBorder:
        //     OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(color: Colors.black),
        // ),
      ),
    );
    final lnamefield = TextFormField(
      autofocus: false,
      controller: lnameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          //return ("Last Name cannot be Empty");
          lnameController.text = um.lname!;
        } else if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
          return ("Enter correct Last Name ALBHABETS ONLY");
        } else if (!regex.hasMatch(value)) {
          return ("Enter Valid Last Name(Min 2 Character)");
        }
        return null;
      },
      onSaved: (value) {
        lnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        focusColor: Colors.black,
        filled: true,
        hintText: um.lname,
        hintStyle: TextStyle(color: Colors.black),
        labelText: 'Last Name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final nicfield = TextFormField(
      autofocus: false,
      controller: nicController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{13,13}$');
        if (value!.isEmpty) {
          //return ("NIC cannot be Empty");
          nicController.text = um.nic.toString();
        } else if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct NIC (NUMBERS ONLY)");
        } else if (!regex.hasMatch(value)) {
          return ("Enter Valid NIC(13 NUMBERS)");
        }
        return null;
      },
      onSaved: (value) {
        nicController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        focusColor: Colors.black,
        filled: true,
        hintText: um.nic,
        hintStyle: TextStyle(color: Colors.black),
        labelText: 'NIC',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    final contactfield = TextFormField(
      autofocus: false,
      controller: contactController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{11,11}$');
        if (value!.isEmpty) {
          //return ("ContactNO cannot be Empty");
          contactController.text = um.contact.toString();
        } else if (!RegExp(r'^[0-9]').hasMatch(value)) {
          return ("Enter correct contact (NUMBERS ONLY)");
        } else if (!regex.hasMatch(value)) {
          return ("Enter Valid Contact(11 Numbers)");
        }
        return null;
      },
      onSaved: (value) {
        contactController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        focusColor: Colors.black,
        filled: true,
        hintText: um.contact,
        hintStyle: TextStyle(color: Colors.black),
        labelText: 'Contact',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text("Update Info"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.14,
                  right: 35,
                  left: 35),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 160),
                    //   child: Text("First Name",
                    //       style: TextStyle(fontWeight: FontWeight.bold)),
                    // ),
                    fnamefield,
                    SizedBox(
                      height: 30,
                    ),
                    lnamefield,
                    SizedBox(
                      height: 30,
                    ),
                    nicfield,
                    SizedBox(
                      height: 30,
                    ),
                    contactfield,
                    SizedBox(
                      height: 40,
                    ),
                    MaterialButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {
                          update();
                        },
                        elevation: 10,
                        child: Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        )),
                    // Container(
                    //   width: 300,
                    //   height: 100,
                    //   decoration: BoxDecoration(color: Colors.white),
                    //   child: Column(children: <Widget>[
                    //     Text("Fname " + fnameController.text),
                    //     Text("Lname " + lnameController.text),
                    //     Text("NIC " + nicController.text),
                    //     Text("Contact " + contactController.text),
                    //   ]),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void update() async {
    if (_formKey.currentState!.validate()) {
      print(fnameController.text);
      print(lnameController.text);

      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      await firebaseFirestore.collection("users").doc(um.uid).update({
        "contact": contactController.text,
        "firstname": fnameController.text,
        "lastname": lnameController.text,
        "nic": nicController.text
      });
      showSnackBar("Done", Duration(milliseconds: 400));
      Navigator.pushAndRemoveUntil((context),
          MaterialPageRoute(builder: (context) => Welcome()), (route) => false);
    }
  }
}
