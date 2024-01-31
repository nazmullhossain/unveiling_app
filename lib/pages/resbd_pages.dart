import 'dart:convert';

import 'package:flutter/material.dart';

class ResPage extends StatelessWidget {
   ResPage({super.key,required this.body});
  String body;

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> userData = body as Map<String, dynamic>;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text("${body}")
        ),
      ),
    );
  }
}
