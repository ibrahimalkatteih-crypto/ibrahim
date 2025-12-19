import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/services/services.dart';
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

