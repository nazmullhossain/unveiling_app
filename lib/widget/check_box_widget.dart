import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_app/controller/signup_controller.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=SignUpController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(()=>
           Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value){
                  controller.privacyPolicy.value=!controller.privacyPolicy.value;
              },
            ),
          ),
        ),
        SizedBox(width: 5,),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "Are you agree.."
              ),

            ]

          )
        )
      ],
    );
  }
}
