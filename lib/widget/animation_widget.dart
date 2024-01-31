import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class AnimaitonWidget extends StatelessWidget {
   AnimaitonWidget({super.key,
  required this.text,
    required this.images,
    this.showAction=false,
    this.onActionPressed,
    this.actionText
  });
  final String text,images;
 final String? actionText;
  VoidCallback? onActionPressed;
  final bool showAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(images,
          width: MediaQuery.of(context)
          .size.width *0.8),
          SizedBox(height: 10,),
          showAction?
              SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  child: Text(actionText!,
                  ),
                ),
              ):Container()
        ],
      ),
    );
  }
}
