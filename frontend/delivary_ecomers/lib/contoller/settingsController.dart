
import 'package:delivary_ecomers/core/constant/appRoots.dart';
import 'package:delivary_ecomers/core/service/myservices.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController{
  logOut();
  
}

class SettingscontrollerIMp extends SettingsController {

  MyServices myServices=Get.find();
  @override
  logOut() async{
    final keys = [
      "id",
      "username",
      "email",
      "phone",
      "step"
    ];
    for (final key in keys) {
      await myServices.sharedPreferences.remove(key);
    }
    Get.offAllNamed(AppRoots.login);
    }
  }

