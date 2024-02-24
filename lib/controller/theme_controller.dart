import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController{

  bool _isDark=false;
  bool get isDark=>_isDark;

  changeTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _isDark= !_isDark;
    prefs.setBool("dark", _isDark);
    print(_isDark);
    update();
  }
  getDark()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark=await prefs.getBool("dark")??false;
 update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDark();
  }
}