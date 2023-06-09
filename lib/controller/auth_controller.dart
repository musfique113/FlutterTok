import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertok/model/user.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/home.dart';



class AuthController extends GetxController {
  static AuthController instance = Get.find();

  File? proimg;

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    //if(image == null) return;
    final img = File(image!.path);
    this.proimg = img;
  }

  //user state persistence
  late Rx<User?> _user; //obserable keyword
  User get user => _user.value!;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
    //Rx - Observable Keyword - Continuously Checking Variable is changing Or not
  }
  _setInitialView(User? user){
    if(user == null){
      Get.offAll(()=> LoginScreen());
    }else{
      Get.offAll(() => HomeScreen());
    }
  }

  //to reg user
  void SignUp(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadProPic(image);

        myUser user = myUser(
            uid: credential.user!.uid,
            email: email,
            name: username,
            profilePhoto: downloadUrl);

        //uploadin data
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
            "Error Creating Account", "Please enter all the required fields");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Occured", e.toString());
    }
  }

  //private class(_) no other class can access this
  Future<String> _uploadProPic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDownUrl = await snapshot.ref.getDownloadURL();
    return imageDownUrl;
  }

  void login(String email, String password) async
  {

    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      }else{
        Get.snackbar("Error Logging In", "Please enter all the fields");
      }


    }catch(e){
      Get.snackbar("Error Logging In",e.toString());
    }
  }
}
