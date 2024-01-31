import 'package:flutter/material.dart';

class DeatilsPage extends StatelessWidget {
   DeatilsPage({super.key,required this.day1});
  String day1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deatils")
        ,centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("${day1}")
            ],
          ),
        ),
      ),
    );
  }
}
