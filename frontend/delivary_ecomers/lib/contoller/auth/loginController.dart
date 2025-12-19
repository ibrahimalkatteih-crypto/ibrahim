import 'package:delivary_ecomers/core/class/statusRequest.dart';
import 'package:delivary_ecomers/core/constant/appRoots.dart';
import 'package:delivary_ecomers/core/function/handlingData.dart';
import 'package:delivary_ecomers/core/service/myservices.dart';
import 'package:delivary_ecomers/data/datasourse/remote/auth/loginData.dart';
import 'package:delivary_ecomers/view/screen/auth/checkEmail.dart';
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

        if (response['data']['delivary_approve'] == 1) {
          myServices.sharedPreferences.setString(
            "id",
            response['data']['delivary_id'].toString(),
          );
          myServices.sharedPreferences.setString(
            "username",
            response['data']['delivary_username'].toString(),
          );
          myServices.sharedPreferences.setString(
            "email",
            response['data']['delivary_email'].toString(),
          );
          myServices.sharedPreferences.setString(
            "phone",
            response['data']['delivary_phone'].toString(),
          );
          myServices.sharedPreferences.setString('step', '2');

          FirebaseMessaging.instance
              .subscribeToTopic("delivery${response['data']['delivary_id']}")
              .then((_) {
                print("✅ تم الاشتراك بالتوبيك brro1");
              })
              .catchError((e) {
                print("❌ فشل الاشتراك: $e");
              });

          FirebaseMessaging.instance.subscribeToTopic("delivery");

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
