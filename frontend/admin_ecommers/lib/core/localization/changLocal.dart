
import 'package:admin_ecommers/core/constant/appTheme.dart';
import 'package:admin_ecommers/core/function/fcm.dart';
import 'package:admin_ecommers/core/service/myservices.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'dart:ui';



class LocalControlar extends GetxController {
  Locale? lang;
  ThemeData appTheme = themeEnglish;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    requestNotificationPermission();
    fcmConfig();
    super.onInit();

    String? sharedLang = myServices.sharedPreferences.getString('lang');
    String langCode = sharedLang ?? Get.deviceLocale?.languageCode ?? 'en';

    lang = Locale(langCode);
    appTheme = langCode == 'ar' ? themeArabic : themeEnglish;

    Get.changeTheme(appTheme);
    Get.updateLocale(lang!);
  }

  void changLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString('lang', langCode);
    myServices.sharedPreferences.setString('step','1');
    appTheme = langCode == 'ar' ? themeArabic : themeEnglish;

    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  Future<void> requestPermisionLoction() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
       Get.snackbar("ملاحظة", "يرجى تفعيل خدمة الموقع ...!");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
         Get.snackbar("ملاحظة", "تم رفض إذن الموقع ...!");
      }
    }

    if (permission == LocationPermission.deniedForever) {
       Get.snackbar("ملاحظة", "لا يمكن استخدام التطبيق بدون إذن الموقع ...!");
    }
  }
}
