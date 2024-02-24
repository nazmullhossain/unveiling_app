import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_app/controller/auth_reposity_conroller.dart';
import 'package:video_app/model/signUp_model.dart';
import 'package:video_app/pages/login_pages.dart';
import 'package:video_app/widget/loader_widget.dart';
import 'package:video_app/widget/network_manager_widget.dart';
import 'package:video_app/widget/show_dialog_widget.dart';

import '../widget/bottom_bar_widget.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final authReposityConroller = Get.put(AuthReposityConroller());

  //varriable

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final isPayment = true.obs;

  final TextEditingController  email = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController userName = TextEditingController();


  FirebaseAuth auth = FirebaseAuth.instance;

  Future updateEm(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update(updateInfo);
  }

   signUp(BuildContext context,String email,
      String phoneNumber,
      String userName,
      String lastName,
      String firstName,
      String password,


      ) async {
    try {
//start loading
      ShowDialog.openLoadingDialog(
          "We are processing your information", "images/ti.png", context);
      //check internet connectivity
      final isConnected = await NetworkManagerWidget.instance.isConnected();
      if (!isConnected) return;

      if (email.isEmpty && password.isEmpty && firstName.isEmpty && lastName.isEmpty && userName.isEmpty && phoneNumber.isEmpty) return;
      if (!privacyPolicy.value) {
        LoaderWidget.warningSnackBar(
            title: "Accept privacy policy",
            message:
                "In order to create account, you must have to read adn accept the privacy policy & Terms of use");
        return;
      }

      final userCradiatial =
          await authReposityConroller.registerWithEmailAndPassword(
              email, password);

      //
      // Map<String,dynamic>data={
      //   "name": _nameController.text,
      //   "title":_titleController.text,
      //   "week": _weekController.text,
      //   "day": _dayController.text,
      //
      //   "id":id
      // };
      final newUser = SignUpModel(
          email: email,
          phoneNumber: phoneNumber,
          userName: userName,
          lastName: lastName,
          firstName: firstName,
          id: userCradiatial.user!.uid,
        monthTime: DateTime.now(),
          yearTime: DateTime.now(),
          ispayment: false,
          profilePic: "");
      await authReposityConroller.saveUserRecord(newUser);


      LoaderWidget.sucessSnackBar(
          title: "Congratulation",
          message: "your account has been created. Now you can log in");
      await  Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));


    } catch (e) {
      LoaderWidget.warningSnackBar(title: "oh snap!", message: e.toString());
    } finally {
      ShowDialog.stopLoading();
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("sucess");
      return userCredential.user;

      // Navigate to the next screen after successful login
    } catch (e) {
      // Handle login errors
      print(e.toString());
    }
    return null;
  }
}
