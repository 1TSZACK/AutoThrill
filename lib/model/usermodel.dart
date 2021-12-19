// ignore_for_file: non_constant_identifier_names, unnecessary_this, unused_local_variable

class UserModel {
  String? uid;
  String? email;
  String? fname;
  String? lname;
  String? nic;
  String? contact;

  UserModel(
      {this.uid, this.email, this.fname, this.lname, this.nic, this.contact});

  Setter(String u, String e, String f, String l, String n, String c) {
    uid = u;
    email = e;
    fname = f;
    lname = l;
    nic = n;
    contact = c;
  }

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        fname: map['firstname'],
        lname: map['lastname'],
        nic: map['nic'],
        contact: map['contact']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': fname,
      'lastname': lname,
      'nic': nic,
      'contact': contact
    };
  }
}
