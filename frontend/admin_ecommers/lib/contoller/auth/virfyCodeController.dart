import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/data/datasourse/remote/auth/virfycodeData.dart';

import 'package:get/get.dart';

abstract class VirfyCodeController extends GetxController {}

class VirfyCodeControllerImp extends VirfyCodeController {
  String? email;

  VirfyCodeData virfyCodeData = VirfyCodeData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  goToResstPasswprd(code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await virfyCodeData.virfyCodeData(email!, code);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoots.resetPassword,arguments: {"email":email!});
      }
    } else {
      Get.defaultDialog(title: 'warning', middleText: '32'.tr);
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  resend() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await virfyCodeData.reSendData(email!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("succes","40".tr );
      }
    } 
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
