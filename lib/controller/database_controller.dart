import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{


  Future addData(Map<String,dynamic>addData,String id)async{
    return await FirebaseFirestore.instance
        .collection("book").doc(id).set(addData);

  }


  Future <Stream<QuerySnapshot>>getData()async{
    return await FirebaseFirestore.instance
        .collection('book').snapshots();
  }

  Future updateEm(String id , Map<String,dynamic> updateInfo)async{
    return await FirebaseFirestore.instance
        .collection("book").doc(id).update(updateInfo);
  }

  Future delEm(String id )async{
    return await FirebaseFirestore.instance
        .collection("book").doc(id).delete();
  }
}