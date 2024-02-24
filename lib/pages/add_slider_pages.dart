import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_app/widget/text_filed.dart';

import '../controller/database_controller.dart';
import 'package:random_string/random_string.dart';

class AddSliderPage extends StatefulWidget {
  const AddSliderPage({super.key});

  @override
  State<AddSliderPage> createState() => _AddSliderPageState();
}

class _AddSliderPageState extends State<AddSliderPage> {
  DatabaseService databaseService = DatabaseService();

  TextEditingController _slider = TextEditingController();
  TextEditingController _update = TextEditingController();
  Stream? emp;
  getData() async {
    emp = await databaseService.getData("slider");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: emp,
            builder: (context, AsyncSnapshot sn) {
              return sn.hasData
                  ? SizedBox(
                      height: 600,
                      child: ListView.builder(
                          itemCount: sn.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds = sn.data.docs[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20),
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey),
                                  child: Text(
                                    "${ds["slider"]}",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ),
                                OutlinedButton(
                                    onPressed: () {
                                      _slider.text = ds["slider"];

                                      editEm(ds["id"]);
                                    },
                                    child: Text("Edit")),
                              ],
                            );
                          }),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
      floatingActionButton: StreamBuilder(
          stream: emp,
          builder: (context, AsyncSnapshot sn) {
            return sn.hasData
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: FloatingActionButton(
                      onPressed: () {
                        addEm();
                      },
                      child: Text("Add"),
                    ),
                  );
          }),
    );
  }

  Future editEm(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              height: 300,
              child: Column(
                children: [
                  Text(
                    "Update Slider Text",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomField(
                    controller: _slider,
                    hintText: 'name',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                      onPressed: () async {
                        Map<String, dynamic> data = {
                          "slider": _slider.text,
                          "id": id,
                        };
                        await databaseService.updateSlider(id, data);
                        Navigator.pop(context);
                      },
                      child: Text("Update"))
                ],
              ),
            ),
          ));
  Future addEm() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              height: 300,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Add  slider",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomField(
                    controller: _slider,
                    hintText: 'slider text..',
                  ),
                  OutlinedButton(
                      onPressed: () async {
                        String id = randomAlphaNumeric(10);

                        Map<String, dynamic> data = {
                          "slider": _slider.text,
                          "id": id
                        };
                        if (_slider.text.isNotEmpty) {
                          await DatabaseService()
                              .addSlider(data, id)
                              .then((value) {
                            print("check ${value}");
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please complete all field",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }

                        Navigator.pop(context);
                        _slider.clear();
                      },
                      child: Text("submit"))
                ],
              ),
            ),
          ));
}
