import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/data/datasourse/remote/auth/resetpassword.dart';
import 'package:get/get.dart';

abstract class ResetPasswordControllar extends GetxController {

  goToSignIn();
}

class ResetPasswordControllarImp extends ResetPasswordControllar {
  ResetPass resetPass=ResetPass(Get.find());
  
  late TextEditingController password;
  late TextEditingController rePassword;



  late String email;

  
  
  StatusRequest statusRequest=StatusRequest.none;

  @override
  goToSignIn() async{

    statusRequest = StatusRequest.loading;


    
  update();
    var response = await resetPass.postDataa(
      
      email,
      password.text,
    );
        print("$response ===========================");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
            Get.offNamed(AppRoots.login);

        // data.addAll(response['data']);
        // Center(child: Lottie.asset(ImageAsset.loding),);
        
      } else {

        Get.defaultDialog(title: 'warning', middleText: '32'.tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();







  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword=TextEditingController();
    email=Get.arguments['email'];
    super.onInit();
  }

  ondispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
