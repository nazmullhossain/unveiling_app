import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animation_widget.dart';

class ShowDialog{
  static void openLoadingDialog(String text,String images,BuildContext context){
    showDialog(context: Get.overlayContext!, builder: (_)=>PopScope(
      canPop: false,
        child: Container(
          color: Colors.pink,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 250,),
              AnimaitonWidget(text: text,  images: images,)

            ],
          ),
        )));
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}