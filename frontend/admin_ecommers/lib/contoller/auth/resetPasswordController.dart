
import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/data/datasourse/remote/auth/resetPasswordData.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {}

class ResePasswordControllerImp extends ResetPasswordController {
  ResetPasswordData resetPasswordData=ResetPasswordData(Get.find());
  TextEditingController? password;
  TextEditingController? suPassword;
  bool isShowPassword = true;

  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  visiblePassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  goToSucces() {
    if (password!.text != suPassword!.text) {
      return "38".tr;
    } else {
      resetPassword();

    }
    update();
  }


  resetPassword()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await resetPasswordData.resetPasswordData(email!,password!.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print("=========================================");
        Get.offAllNamed(AppRoots.login);
      } else {
        Get.defaultDialog(title: 'warning', middleText: '42'.tr);
      }
    }else{
              statusRequest = StatusRequest.failure;

    }
    update();
  }






  @override
  void onInit() {
    password = TextEditingController();
    suPassword = TextEditingController() ;
    email=Get.arguments["email"];
    super.onInit();
  }
}
