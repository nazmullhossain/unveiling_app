import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_app/pages/home_pages.dart';
import 'package:video_app/pages/signup_pages.dart';
import 'package:video_app/widget/bottom_bar_widget.dart';

import '../controller/signup_controller.dart';
import '../widget/loader_widget.dart';
import '../widget/validation_widget.dart';
import 'navigation_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  bool _isLoggingIn = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }
  final conroller=Get.put(SignUpController());
  final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff48043F),
        title: Text("SignIn",style: TextStyle(color: Colors.white),),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height *.2,),
                TextFormField(
                  validator: (value) => ValidiationWidget.validateEmail(value),
                  controller: _email,
                  expands: false,
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

                SizedBox(height: 15,),
                Obx(() => TextFormField(
                  controller: _password,
                  validator: (value) => ValidiationWidget.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "password",
                    prefixIcon: Icon(CupertinoIcons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          controller.hidePassword.value =
                          !controller.hidePassword.value;
                        },
                        child: Icon(controller.hidePassword.value
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_fill)),
                  ),
                )),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff48043F),
                      padding: EdgeInsets.symmetric(horizontal: 100),
                    ),
                    onPressed: ()async{
                      if(_email.text.isNotEmpty && _password.text.isNotEmpty){
                        setState(() {
                          _isLoggingIn = true;
                        });
                        await Future.delayed(Duration(seconds: 3)); // Simulate a 3-second delay
                        _signIn();

                        setState(() {
                          _isLoggingIn = false;
                        });

                      }else{
                        LoaderWidget.warningSnackBar(title: "Required*", message: "Please enter all field");
                      }

                }, child:_isLoggingIn?Center(child: CircularProgressIndicator(color: Colors.white,),): Text("Login ",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 8,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignUpPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    // alignment: Alignment.bottomRight,
                    child: Text("Create an Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                    fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,

                    ),),
                  ),
                ),
                // ElevatedButton(onPressed: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                // }, child: Text("send"))
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _signIn()async{
    String email=_email.text;
    String password=_password.text;

    User?user=await conroller.login(email, password);
    if(user !=null){
      print("login sucesss");
      LoaderWidget.warningSnackBar(title: "Congratulation", message: "Login Success");
      print("helllllllllll${user.uid}");
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', '${user.uid}');
    await  Navigator.push(context, MaterialPageRoute(builder: (_)=>NavigationWidget()));
    }else{
      print("some error");
      LoaderWidget.warningSnackBar(title: "oh man!", message: "Invalid email && password");
    }

  }

}
