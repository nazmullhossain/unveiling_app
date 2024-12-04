import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_app/pages/login_pages.dart';
import 'package:video_app/widget/text_filed.dart';
import 'package:video_app/widget/validation_widget.dart';

import '../controller/signup_controller.dart';
import 'check_box_widget.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  final controller = Get.put(SignUpController());
  final TextEditingController email = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController userName = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    lastName.dispose();
    firstName.dispose();
    password.dispose();
    phoneNumber.dispose();
    userName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpFormKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: firstName,
                  validator: (value) =>
                      ValidiationWidget.validateEmtyText("First name", value),
                  expands: false,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "First Name",
                      prefixIcon: Icon(Icons.person)),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextFormField(
                  controller: lastName,
                  validator: (value) =>
                      ValidiationWidget.validateEmtyText("Last name", value),
                  expands: false,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Last Name",
                      prefixIcon: Icon(Icons.person)),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: userName,
              validator: (value) =>
                  ValidiationWidget.validateEmtyText("user name", value),
              expands: false,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Username",
                  prefixIcon: Icon(Icons.edit)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) => ValidiationWidget.validateEmail(value),
              controller: email,
              // expands: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: phoneNumber,
              validator: (value) =>
                  ValidiationWidget.validateEmtyText("phone number", value),
              expands: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Phone",
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            //password
            SizedBox(
              height: 10,
            ),
            Obx(() => TextFormField(
                  controller: password,
                  validator: (value) =>
                      ValidiationWidget.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: InkWell(
                        onTap: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        child: Icon(controller.hidePassword.value
                            ? CupertinoIcons.eye
                            : Icons.remove_red_eye)),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            CheckBoxWidget(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0xff003300),
                  padding: EdgeInsets.symmetric(horizontal: 100),
                ),
                onPressed: () async {
                  print("click");

                  await controller.signUp(
                      context,
                      email.text.trim(),
                      phoneNumber.text.trim(),
                      userName.text.trim(),
                      lastName.text.trim(),
                      firstName.text.trim(),
                      password.text.trim());
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
