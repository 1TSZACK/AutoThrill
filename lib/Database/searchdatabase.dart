// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/carmodel.dart';
import 'package:project/model/usermodel.dart';

class SearchDatabase {
  String? make;
  String? model;
  SearchDatabase({this.make, this.model});
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List?> read() async {
    UserModel um = UserModel();
    CarModel cm = CarModel();
    QuerySnapshot querySnapshot;
    var url;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('advertise').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(doc['userId'])
              .get()
              .then((ds) {
            um.email = ds['email'];
            um.uid = ds['uid'];
            um.fname = ds['firstname'];
            um.lname = ds['lastname'];
            um.nic = ds['nic'];
            um.contact = ds['contact'];
          });
          print(doc.id);
          print(doc['userId']);
          print(doc['engineNo']);
          await FirebaseFirestore.instance
              .collection('cars')
              .doc(doc['engineNo'])
              .get()
              .then((dc) {
            cm.assembly = dc['assembly'];
            cm.bodtype = dc['bodtype'];
            cm.cartype = dc['cartype'];
            cm.city = dc['city'];
            cm.color = dc['color'];
            cm.enginecapacity = dc['enginecapacity'];
            cm.engineno = dc['engineno'];
            cm.fueltype = dc['fueltype'];
            cm.kilometers = dc['kilometers'];
            cm.make = dc['make'];
            cm.model = dc['model'];
            cm.price = dc['price'];
            cm.registered = dc['registered'];
            cm.transmission = dc['transmission'];
            cm.version = dc['version'];
            cm.year = dc['year'];
          });
          print("hiiiiiiiiiooooo");
          await FirebaseFirestore.instance
              .collection("cars")
              .doc(doc['engineNo'])
              .collection("images")
              .doc(doc['engineNo'])
              .get()
              .then((ic) {
            url = ic['downloadURL'];
          });
          print("Hiiiiiiiiii");
          Map a = {
            "userId": doc['userId'],
            "contact": um.contact,
            "email": um.email,
            "fname": um.fname,
            "lname": um.lname,
            "featured": doc['featuredprice'],
            "engineNo": doc['engineNo'],
            "assembly": cm.assembly,
            "bodtype": cm.bodtype,
            "cartype": cm.cartype,
            "city": cm.city,
            "color": cm.color,
            "enginecapacity": cm.enginecapacity,
            "fueltype": cm.fueltype,
            "kilometers": cm.kilometers,
            "make": cm.make,
            "model": cm.model,
            "price": cm.price,
            "registered": cm.registered,
            "transmission": cm.transmission,
            "version": cm.version,
            "year": cm.year,
            "url": url,
          };
          print("hgggggggggggkkkkkkkkkkkkkkkkkkkkkkkkk");
          if (cm.make == make && cm.model == model) {
            print(make);
            docs.add(a);
          }

          print("vbbbbbbbbbbbbbbb");
        }

        return docs;
      }
    } catch (e) {
      print(e);
    }
  }
}
