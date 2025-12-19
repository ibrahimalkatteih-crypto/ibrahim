import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/core/constant/iamgeasset.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/data/datasourse/remote/auth/sign_up.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

abstract class SignInControllar extends GetxController {
  // ignore: non_constant_identifier_names
  sign_up();

  goToSignIn();
}

class SignInControlarImp extends SignInControllar {
  SignUpData signUpData = SignUpData(Get.find());

  late TextEditingController userName;
  late TextEditingController email;

  late TextEditingController Phone;
  late TextEditingController password;

  StatusRequest statusRequest=StatusRequest.none;
  List data = [];
  @override
  // ignore: non_constant_identifier_names
  sign_up() async {
    statusRequest = StatusRequest.loading ;
    update();
    var response = await signUpData.postDataa(
      userName.text,
      email.text,
      password.text,
      Phone.text,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        // Center(child: Lottie.asset(ImageAsset.loding),);
        Get.offNamed(
          AppRoots.verifiycodeSignUp,
          arguments: {'email': email.text},
        );
      } else {
        Get.defaultDialog(title: 'warning', middleText: '31'.tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoots.login);
  }

  @override
  void onInit() {
    userName = TextEditingController();
    Phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  ondispose() {
    userName.dispose();
    Phone.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
