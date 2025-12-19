import 'package:flutter_application_3/core/services/services.dart';
import 'package:get/get.dart';

translatedDatabase(String culomnEn, String culomAr) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString('lang') == 'ar') {
    return culomAr;
  } else {
    return culomnEn;
  }
}
