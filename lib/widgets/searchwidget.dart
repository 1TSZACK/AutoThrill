// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:project/ViewSearch.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final modelfield = TextFormField(
        controller: modelController,
        keyboardType: TextInputType.name,
        validator: (value) {
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
          labelText: 'Model',
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
    final makefield = TextFormField(
      controller: makeController,
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
        makeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        filled: true,
        hintText: "Model Make",
        labelText: 'Model Make',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(
            right: 10, left: 10, top: MediaQuery.of(context).size.height * 0.2),
        child: Column(
            //margin: EdgeInsest.any(),
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              modelfield,
              SizedBox(height: 20),
              makefield,
              SizedBox(height: 30),
              MaterialButton(
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ViewSearch(
                        model: modelController.text, make: makeController.text);
                  }));
                },
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  width: 90,
                  height: 60,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Search",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Icon(Icons.search, size: 20, color: Colors.white),
                      ]),
                ),
              ),
            ]),
      ),
    );
  }
}
