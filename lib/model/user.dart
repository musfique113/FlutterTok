import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String profilePhoto;
  String email;
  String uid;

  myUser(
      {required this.uid,
      required this.email,
      required this.name,
      required this.profilePhoto});

  //map to json , json to map
  //app to firebase data sending

  Map<String, dynamic> toJson() =>
      {"name": name, "profilePic": profilePhoto, "email": email, "uid": uid};

  //firebase to user data fetching
  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
      email: snapshot["email"],
      profilePhoto: snapshot["profilePic"],
      uid: snapshot["uid"],
      name: snapshot["name"]
    );
  }
}
