import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_app/widget/text_filed.dart';

import '../controller/auth_reposity_conroller.dart';
import '../controller/signup_controller.dart';
import '../model/signUp_model.dart';
import '../widget/loader_widget.dart';
import '../widget/network_manager_widget.dart';
import '../widget/show_dialog_widget.dart';
import '../widget/signup_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
final conroller=Get.put(SignUpController());
  final authReposityConroller = Get.put(AuthReposityConroller());
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   email.dispose();
  //   lastName.dispose();
  //   firstName.dispose();
  //   password.dispose();
  //   phoneNumber.dispose();
  //   userName.dispose();
  // }
  final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xff48043F).withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Color(0xff48043F),
        title: Text("SignUp",style: TextStyle(color: Colors.white),),centerTitle: true,),
      body: SingleChildScrollView(
        child: Form(
          key: signUpFormKey,
          child: Column(
            children: [
              SignUpWidget()
            ],
          )
        ),
      ),
    );
  }

}
