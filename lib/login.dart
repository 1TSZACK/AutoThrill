// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, must_be_immutable, unused_import, avoid_print, avoid_function_literals_in_foreach_calls

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project/signup.dart';
import 'package:project/welcome.dart';
import 'package:project/modules/http.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class User {
  String email;
  String password;
  User(this.email, this.password);
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<User> users = [];
  Future<void> refreshUsers() async {
    var result = await http_get('users');
    if (result.ok) {
      setState(() {
        users.clear();
        var in_users = result.data as List<dynamic>;
        in_users.forEach((in_user) {
          print(in_user['email'].toString());
          users.add(User(
              in_user['email'].toString(), in_user['password'].toString()));
        });
      });
    }
  }

  bool check(var email, var password) {
    refreshUsers();

    bool flag = false;
    Text(email);
    users.forEach((usr) {
      if (usr.email == email && usr.password == password) {
        flag = true;
      }
    });
    return flag;
  }

  bool _obscure_Text = true;
  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscure_Text = !_obscure_Text;
                                });
                              },
                              child: Icon(_obscure_Text
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        obscureText: _obscure_Text,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        minWidth: 200,
                        height: 60,
                        onPressed: () {
                          check(emailController.text.toString(),
                                  passwordController.text.toString())
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Welcome()))
                              : Text('Error');
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
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
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
                  ))
            ],
          ),
        ));
  }
}
