import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/auth/login.dart';
import 'package:get/get.dart';

abstract class LoginControllar extends GetxController {
  login();

  goToSignUp();
}

class LoginControlarImp extends LoginControllar {
  LoginData loginData = LoginData(Get.find());

  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;

  MyServices myServices = Get.find();

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;
  @override
  login() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData.postDataa(email.text, password.text);

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        // Center(child: Lottie.asset(ImageAsset.loding),);

        if (response['data']['users_approve'] == 1) {
          myServices.sharedPreferences.setString(
            "id",
            response['data']['users_id'].toString(),
          );
          myServices.sharedPreferences.setString(
            "username",
            response['data']['users_name'],
          );

          myServices.sharedPreferences.setString(
            "email",
            response['data']['users_email'],
          );

          myServices.sharedPreferences.setString(
            "phone",
            response['data']['users_phone'],
          );
          String usersId = response['data']['users_id'].toString();
          FirebaseMessaging.instance
              .subscribeToTopic("brro$usersId")
              .then((_) {
                print("✅ تم الاشتراك بالتوبيك brro1");
              })
              .catchError((e) {
                print("❌ فشل الاشتراك: $e");
              });
          await FirebaseMessaging.instance.subscribeToTopic("brro");

          myServices.sharedPreferences.setString("step", '2');
          Get.offNamed(AppRoots.home);
        } else {
          Get.toNamed(
            AppRoots.verifiycodeSignUp,
            arguments: {'email': email.text},
          );
        }
      } else {
        Get.defaultDialog(title: 'warning', middleText: '33'.tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoots.sign_up);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      //print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  ondispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
