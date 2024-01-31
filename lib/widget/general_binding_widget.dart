
import 'package:get/get.dart';
import 'package:video_app/widget/network_manager_widget.dart';

class GeneralBindigs extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManagerWidget());
  }
}