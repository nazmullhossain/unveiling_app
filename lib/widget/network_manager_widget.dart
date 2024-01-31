import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_app/widget/loader_widget.dart';

class NetworkManagerWidget extends GetxController{
  static NetworkManagerWidget get instance =>Get.find();


  final Connectivity _connectivity=Connectivity();
  late StreamSubscription<ConnectivityResult>_connectivitySubscription;
  final Rx<ConnectivityResult> _connectivitStatus=ConnectivityResult.none.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _connectivitySubscription=_connectivity.onConnectivityChanged
    .listen( _updateConectionState);
  }
  Future<void>_updateConectionState(ConnectivityResult result)async{
    _connectivitStatus.value=result;
    if(_connectivitStatus.value==ConnectivityResult.none){
      LoaderWidget.warningSnackBar(title: "No internet Connection");
    }
  }
Future<bool>isConnected()async{
    try{
      final result=await _connectivity.checkConnectivity();
      if(result==ConnectivityResult.none){
        return false;
      }else{
        return true;
      }
    }on PlatformException catch(_){
      return false;

    }
}
@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _connectivitySubscription.cancel();
  }

}