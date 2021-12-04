import 'package:autothrill/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';


class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Widget categoriesContainer(){
    return  Container(
      height: 150,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 150,
              width: 140,
              decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage('cardollar.jpg')),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 30),
            Column(
              children: [
                Text(
                  "Car"+"Alto",
                  style: TextStyle(fontSize: 20,color:Colors.white),
                ),
                Text(
                  "Price "+" 34,613",
                  style: TextStyle(fontSize: 20,color:Colors.white),
                ),
                Text(
                  "Model year: "+ "2020",
                  style: TextStyle(fontSize: 20,color:Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: (){},
                  child:
                  Text("See Details"),
                ),
              ],
            ),
          ],

        ),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[800],
        child: Scaffold(
          drawer: NavigationDrawerWidget(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            //title: Text('Welcome'),
            //automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: [

              SingleChildScrollView(
                scrollDirection: Axis.vertical,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.search,color: Colors.white,),
                          filled:true,
                          fillColor: Colors.white24,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      categoriesContainer(),
                      SizedBox(height: 10,),
                      categoriesContainer(),
                      SizedBox(height: 10,),
                      categoriesContainer(),
                      SizedBox(height: 10,),
                      categoriesContainer(),
                      SizedBox(height: 10,),

                    ],
                  ),
              ),


            ],
          ),
        ),
    );
  }
}
