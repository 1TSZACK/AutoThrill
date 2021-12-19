// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/carmodel.dart';
import 'package:project/model/usermodel.dart';

class MyCarDatabase {
  String? zid;
  MyCarDatabase({this.zid});
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List?> read() async {
    print("innnnnnnnnn");
    print(zid);
    UserModel um = UserModel();
    CarModel cm = CarModel();
    QuerySnapshot querySnapshot;
    var url;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('advertise').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          print(doc['userId']);
          if (doc['userId'] == zid) {
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
            print("zooooooooooooo");
            await FirebaseFirestore.instance
                .collection("cars")
                .doc(doc['engineNo'])
                .collection("images")
                .doc(doc['engineNo'])
                .get()
                .then((ic) {
              url = ic['downloadURL'];
            });
            print("zkkkkkkkkkkkkkkkk");
            Map a = {
              "adId": doc.id,
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
            print("zvvvvvvvvvvvvvvv");
            docs.add(a);
            print("zzdddddddddddddddd");
          }
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }
}
