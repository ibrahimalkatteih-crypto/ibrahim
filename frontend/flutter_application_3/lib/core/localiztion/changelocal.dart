import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/appTheme.dart';
import 'package:flutter_application_3/core/myfunctions/fcm.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'dart:ui';

class LocalControlar extends GetxController {
  Locale? lang;

  ThemeData appTheme = themeEnglish;

  MyServices myServices = Get.find();

  changLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString('lang', langCode);

    appTheme = langCode == 'ar' ? themeArabic : themeEnglish;

    Get.changeTheme(appTheme);

    Get.updateLocale(locale);
  }

  requestPermisionLoction() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("note", "Add loction ...!");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("note", "Add loction ...!");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("note", "can,t you use app without loction ...!");
    }
  }

  @override
  void onInit() {
    requestPermissionNotifiction();
    fcmConfig();
    requestPermisionLoction();
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      lang = Locale('ar');
      appTheme = themeArabic;
    } else if (sharedPrefLang == 'en') {
      lang = Locale('en');
      appTheme = themeEnglish;
    } else {
      lang = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
