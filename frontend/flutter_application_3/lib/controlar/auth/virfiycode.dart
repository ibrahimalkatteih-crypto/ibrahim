import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/data/datasourse/remote/auth/virfiycode.dart';
import 'package:get/get.dart';

abstract class FvirFiyCodeControllar extends GetxController {
  checkCode();

  goToResetPassword(String virFiyCode);
}

class FvirFiyCodeControllarImp extends FvirFiyCodeControllar {
  VirfiyCodeForgetPass virfiyCodeForgetPass =VirfiyCodeForgetPass(Get.find());
  
  late String email;

  @override
  checkCode() {}

  StatusRequest statusRequest=StatusRequest.none;

  @override
  goToResetPassword(String virFiyCode) async{

    statusRequest = StatusRequest.loading;
  update();
    var response = await virfiyCodeForgetPass.postDataa(
      
      email,
      virFiyCode,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
            Get.offNamed(AppRoots.success,arguments: {'email':email});

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
    email=Get.arguments['email'];
    super.onInit();
  }

  ondispose() {
    super.dispose();
  }
}
