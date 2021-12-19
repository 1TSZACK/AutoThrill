// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, prefer_typing_uninitialized_variables, unnecessary_new, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/welcome.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  final _formKey = GlobalKey<FormState>();

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  String response = "";

  bool _obscure_Text1 = true;
  bool _obscure_Text2 = true;

  @override
  Widget build(BuildContext context) {
    final fnamefield = TextFormField(
      autofocus: false,
      controller: fnameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        fnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final lnamefield = TextFormField(
      autofocus: false,
      controller: lnameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Last Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        lnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final nicfield = TextFormField(
      autofocus: false,
      controller: nicController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{13,13}$');
        if (value!.isEmpty) {
          return ("NIC cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid NIC(13 Character)");
        }
        return null;
      },
      onSaved: (value) {
        nicController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.calendar_view_day_outlined),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "NIC",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final contactfield = TextFormField(
      autofocus: false,
      controller: contactController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{11,11}$');
        if (value!.isEmpty) {
          return ("ContactNO cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Contact(11 Numbers)");
        }
        return null;
      },
      onSaved: (value) {
        contactController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Contact",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
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
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final passfield = TextFormField(
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
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Password",
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscure_Text1 = !_obscure_Text1;
              });
            },
            child:
                Icon(_obscure_Text1 ? Icons.visibility : Icons.visibility_off),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      obscureText: _obscure_Text1,
    );
    final cpassfield = TextFormField(
      autofocus: false,
      controller: cpasswordController,
      validator: (value) {
        if (passwordController.text != cpasswordController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        cpasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: "Confirm Password",
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscure_Text2 = !_obscure_Text2;
              });
            },
            child:
                Icon(_obscure_Text2 ? Icons.visibility : Icons.visibility_off),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      obscureText: _obscure_Text2,
    );

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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 5, top: 15),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 33),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
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
                              height: 30,
                            ),
                            emailfield,
                            SizedBox(
                              height: 30,
                            ),
                            passfield,
                            SizedBox(
                              height: 30,
                            ),
                            cpassfield,
                            SizedBox(
                              height: 40,
                            ),
                            MaterialButton(
                              minWidth: 200,
                              height: 60,
                              onPressed: () {
                                signUp(emailController.text,
                                    passwordController.text);
                              },
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fname = fnameController.text;
    userModel.lname = lnameController.text;
    userModel.contact = contactController.text;
    userModel.nic = nicController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Welcome()), (route) => false);
  }
}
