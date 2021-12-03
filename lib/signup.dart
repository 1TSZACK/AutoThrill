// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:project/modules/http.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String response = "";

  createUser() async {
    var result = await http_post("create-user", {
      "name": nameController.text,
      "nic": nicController.text,
      "contact": contactController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });
    if (result.ok) {
      setState(() {
        response = result.data['status'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      color: Colors.grey[800],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
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
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5, top: 15),
                            child: Text(
                              'Create Account',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 33),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintText: "Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: nicController,
                            decoration: InputDecoration(
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintText: "NIC",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: contactController,
                            decoration: InputDecoration(
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintText: "Contact",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          MaterialButton(
                            minWidth: 200,
                            height: 60,
                            onPressed: createUser,
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                          //Text('Check'),
                          Text(response),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                            ],
                          )
                        ],
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
}
