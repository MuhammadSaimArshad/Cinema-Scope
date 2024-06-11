import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:whealchair_guideness/model/user_model.dart';
import 'package:whealchair_guideness/static_data.dart';
import 'package:whealchair_guideness/view/login_signup/login_screen.dart';

class UserSignupController extends GetxController {
  static UserSignupController get to => Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passToggle = true;

  FirebaseFirestore firebase = FirebaseFirestore.instance;
  void registeruser(context) async {
    try {
      UserCredential myuser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User user = myuser.user!;

      String id = user.uid;
      UserModel model = UserModel(
        email: email.text,
        name: name.text,
        token: StaticData.token,
        password: password.text,
        id: id,
        image:
            'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
      );
      await firebase.collection("user").doc(id).set(model.toMap());
      clearForm();
      Fluttertoast.showToast(
        msg: "Signup Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff0EBE7F),
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    } catch (e) {
      print("eror${e.toString()}");
      Fluttertoast.showToast(
        msg: "Check internet connecti...or try another email${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  clearForm() {
    name.clear();
    email.clear();
    password.clear();
    update();
  }
}
