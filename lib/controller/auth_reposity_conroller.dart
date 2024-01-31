import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_app/widget/loader_widget.dart';

import '../model/signUp_model.dart';

class AuthReposityConroller extends GetxController{
  static AuthReposityConroller get instance=>Get.find();

  final _auth=FirebaseAuth.instance;
  final FirebaseFirestore _db=FirebaseFirestore.instance;
  
  
  Future<UserCredential>registerWithEmailAndPassword(String email,String password)async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      throw LoaderWidget.warningSnackBar(title: (e.message));
      
    } on FirebaseException catch (e){
      throw LoaderWidget.warningSnackBar(title: (e.message));
    }on FormatException catch (e){
      throw LoaderWidget.warningSnackBar(title: (e.message));
    }on PlatformException catch (e){
      throw LoaderWidget.warningSnackBar(title: (e.message));
    }catch(e){
      throw "Somethings went wrong.Please try again";
    }
  }
  Future<void>saveUserRecord(SignUpModel user)async{
    try{
      await _db.collection("users").doc(user.id)
          .set(user.toJson());
    }on FirebaseAuthException catch(e){
      throw LoaderWidget.warningSnackBar(title: (e.message));

    } on FirebaseException catch (e){
      throw LoaderWidget.warningSnackBar(title: (e.message));
    }on FormatException catch (e){
      throw LoaderWidget.warningSnackBar(title: (e.message));
    }on PlatformException catch (e){
      throw LoaderWidget.warningSnackBar(title: (e.message));
    }catch(e){
      throw "Somethings went wrong.Please try again";
    }
  }
}