import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/core/service/myservices.dart';
import 'package:admin_ecommers/data/datasourse/remote/auth/loginData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  TextEditingController? email;
  TextEditingController? password;
  bool isShowPassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  visiblePassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  checkEmail() {
    Get.toNamed(AppRoots.checkEmial);
  }

  goToHome() async {
    await getData();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData.getDataa(email!.text, password!.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        print("======================================");

        if (response['data']['admin_approve'] == 1) {
          myServices.sharedPreferences.setString(
            "id",
            response['data']['admin_id'].toString(),
          );
          myServices.sharedPreferences.setString(
            "username",
            response['data']['admin_username'].toString(),
          );
          myServices.sharedPreferences.setString(
            "email",
            response['data']['admin_email'].toString(),
          );
          myServices.sharedPreferences.setString(
            "phone",
            response['data']['admin_phone'].toString(),
          );
          FirebaseMessaging.instance
              .subscribeToTopic("admin${response['data']['admin_id']}")
              .then((_) {
                print("✅ تم الاشتراك بالتوبيك brro1");
              })
              .catchError((e) {
                print("❌ فشل الاشتراك: $e");
              });
          await FirebaseMessaging.instance.subscribeToTopic("admin");

          myServices.sharedPreferences.setString('step', '2');

          Get.offAllNamed(AppRoots.home);
        } else {
          Get.offAllNamed(
            AppRoots.virfycodeLog,
            arguments: {"email": email!.text},
          );
        }
      }
    } else {
      Get.defaultDialog(title: 'warning', middleText: '33'.tr);
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
