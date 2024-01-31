import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDocumentsScreen extends StatefulWidget {




  @override
  State<UserDocumentsScreen> createState() => _UserDocumentsScreenState();
}

class _UserDocumentsScreenState extends State<UserDocumentsScreen> {
  String token="";
  getPrefs()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token =await prefs.getString('token')??"";
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Documents'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users') // Replace 'your_collection_name' with your actual collection name
            .where('id', isEqualTo: "BghYwLNL1wVCVRLZrIhaHg2u4ff2") // Assuming 'uid' is the field name in your documents
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No documents found for this user.'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              // Assuming your documents have a 'title' field
              bool title = doc['ispayment'];
              return ListTile(
                title:doc['ispayment']==false? Text("please payment"):Text("ok"),
                // You can add more widgets to display other fields of the document
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
