// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_const_declarations, avoid_returning_null_for_void

import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context) {
    final name = "Muhammad Zahid";
    final email = "zahid.yousuf@hotmail.com";
    final urlImage =
        'https://www.facebook.com/photo/?fbid=2010521822426055&set=a.107673796044210';
    return Drawer(
      child: Container(
          //you can do both material an container
          color: Colors.black,
          child: ListView(
            padding: padding,
            children: <Widget>[
              buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () => null,
              ),
              const SizedBox(
                height: 48,
              ),
              buildMenuItem(
                text: 'People',
                icon: Icons.people,
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'cars',
                icon: Icons.car_rental,
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(text: 'Mechanic', icon: Icons.car_repair),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(text: 'Favourites', icon: Icons.favorite),
              const SizedBox(
                height: 20,
              ),
              Divider(color: Colors.red[900]),
              const SizedBox(
                height: 20,
              ),
              buildMenuItem(
                  text: 'Transport', icon: Icons.local_shipping_outlined),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(text: 'Help', icon: Icons.headphones_sharp),
            ],
          )),
    );
  }

  Widget buildHeader({
    required String urlImage,
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
  }) {
    final color = Colors.white;
    final hoverColor = Colors.red[900];

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: () {},
    );
  }
}
