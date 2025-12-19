import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/data/datasourse/remote/auth/checkEmailData.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {}

class CheckEmailControllerImp extends CheckEmailController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  TextEditingController? email;
  StatusRequest statusRequest = StatusRequest.none;

  checkEmail() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkEmailData.getDataa(email!.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print("=========================================");
        Get.offAllNamed(AppRoots.virfycode, arguments: {'email': email!.text});
      } else {
        Get.defaultDialog(title: 'warning', middleText: '39'.tr);
      }
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
}
