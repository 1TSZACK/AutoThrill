// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_const_declarations, avoid_returning_null_for_void, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project/aboutus.dart';
import 'package:project/login.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/main.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/mycars.dart';
import 'package:project/updateperson.dart';
import 'package:project/viewperson.dart';
import 'package:project/welcome.dart';

class NavigationDrawerWidget extends StatelessWidget {
  UserModel um;
  NavigationDrawerWidget(this.um);
  final padding = EdgeInsets.symmetric(horizontal: 10);
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final fname = um.fname;
    final lname = um.lname;
    final email = um.email;
    // final urlImage =
    //     'https://www.facebook.com/photo/?fbid=2010521822426055&set=a.107673796044210';
    return Drawer(
      child: Container(
          //you can do both material an container
          color: Colors.black,
          child: ListView(
            padding: padding,
            children: <Widget>[
              buildHeader(
                //urlImage: urlImage,
                name: fname.toString() + ' ' + lname.toString(),
                email: email.toString(),
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ViewPerson(um: um);
                  }));
                },
              ),
              const SizedBox(
                height: 18,
              ),
              buildMenuItem(
                text: 'People',
                icon: Icons.people,
                onClicked: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'My Cars',
                icon: Icons.garage_rounded,
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return MyCar(um: um);
                  }));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'Favourites',
                icon: Icons.favorite,
                onClicked: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Welcome();
                  }));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'LogOut',
                icon: Icons.logout,
                onClicked: () {
                  auth.signOut().then((value) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  });
                },
              ),
              const SizedBox(
                height: 60,
              ),
              Divider(color: Colors.red[900]),
              const SizedBox(
                height: 40,
              ),
              buildMenuItem(
                text: 'Help',
                icon: Icons.call_outlined,
                onClicked: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'About US',
                icon: Icons.info,
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AboutUs();
                  }));
                },
              ),
            ],
          )),
    );
  }

  Widget buildHeader({
    //required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
          onTap: onClicked,
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[800],
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person, color: Colors.red[900]),
                  ),
                  //backgroundImage:
                  //AssetImage("z.jpg") /*NetworkImage(urlImage)*/
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    const SizedBox(height: 4),
                    Text(email,
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                  ],
                )
              ],
            ),
          ));

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.red[900];

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
