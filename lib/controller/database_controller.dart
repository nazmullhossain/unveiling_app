import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{


  Future addData(Map<String,dynamic>addData,String Collection)async{
    return await FirebaseFirestore.instance
        .collection(Collection).doc().set(addData);

  }

  Future addSlider(Map<String,dynamic>addData,String id)async{
    return await FirebaseFirestore.instance
        .collection("slider").doc(id).set(addData);

  }



  Future <Stream<QuerySnapshot>>getData(String colleciton)async{
    return await FirebaseFirestore.instance
        .collection(colleciton).orderBy("month").  snapshots();
  }


  Future <Stream<QuerySnapshot>>getSlider(String colleciton)async{
    return await FirebaseFirestore.instance
        .collection(colleciton).  snapshots();
  }


  Future updateEm(String id , Map<String,dynamic> updateInfo)async{
    return await FirebaseFirestore.instance
        .collection("book").doc(id).update(updateInfo);
  }


  Future updateSlider(String id , Map<String,dynamic> updateInfo)async{
    return await FirebaseFirestore.instance
        .collection("slider").doc(id).update(updateInfo);
  }


  Future certaindMedthod(String uid )async{
    return await FirebaseFirestore.instance
        .collection("users").where("id",isEqualTo:uid);
  }

  Future delEm(String id )async{
    return await FirebaseFirestore.instance
        .collection("slider").doc(id).delete();
  }
}