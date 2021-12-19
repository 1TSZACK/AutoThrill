// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, must_be_immutable, unused_import, avoid_print, avoid_function_literals_in_foreach_calls, unused_field, unused_label, unused_local_variable, unnecessary_new

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/signup.dart';
import 'package:project/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  User? user;
  String errorMessage = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscure_Text = true;

  @override
  Widget build(BuildContext context) {
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordfield = TextFormField(
      autofocus: false,
      controller: passwordController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: 'Password',
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscure_Text = !_obscure_Text;
              });
            },
            child:
                Icon(_obscure_Text ? Icons.visibility : Icons.visibility_off),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      obscureText: _obscure_Text,
    );

    return Container(
        color: Colors.grey[800],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 135, top: 80),
                child: Text('Welcome',
                    style: TextStyle(color: Colors.white, fontSize: 33)),
              ),
              SingleChildScrollView(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35,
                      right: 35,
                      left: 35), //Media query gives the sizes of screen
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        emailfield,
                        SizedBox(height: 30),
                        passwordfield,
                        SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          minWidth: 200,
                          height: 60,
                          onPressed: () {
                            signIn(
                                emailController.text, passwordController.text);
                          },
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Signup();
                                  }));
                                },
                                child: Text('Sign Up',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.underline))),
                            TextButton(
                                onPressed: () {},
                                child: Text('Forget Password',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.underline)))
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  //User? user = _auth.currentUser,
                  //Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Welcome())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            print(errorMessage);
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        // Fluttertoast.showToast(
        //     msg: errorMessage,
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.black,
        //     fontSize: 16.0
        //     );
        print(error.code);
        Text(errorMessage, style: TextStyle(fontSize: 20, color: Colors.red));
      }
    }
  }
}
