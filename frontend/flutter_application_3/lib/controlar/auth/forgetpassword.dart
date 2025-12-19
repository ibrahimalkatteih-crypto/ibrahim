import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/data/datasourse/remote/auth/checkemail.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordControllar extends GetxController {

  checkemail();

  goToVerfiyCode();
}

  
class ForgetPasswordImp extends ForgetPasswordControllar {
  CheckEmailPass checkEmail=CheckEmailPass(Get.find());
  late TextEditingController email ;
  

  @override
  checkemail() {
    
  }

  StatusRequest statusRequest=StatusRequest.none;

  @override
  goToVerfiyCode() async{

    statusRequest = StatusRequest.loading;
    update();
    var response = await checkEmail.postDataa(email.text);
    print("$response ===========================");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        // Center(child: Lottie.asset(ImageAsset.loding),);
        Get.offNamed(AppRoots.verifiycode,arguments: {'email':email.text});

      } else {
        Get.defaultDialog(title: 'warning', middleText: '33'.tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();







  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  ondispose() {
    email.dispose();
    super.dispose();
  }
}
