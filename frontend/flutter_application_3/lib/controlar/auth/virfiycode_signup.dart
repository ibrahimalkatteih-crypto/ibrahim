import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/data/datasourse/remote/auth/virfiycodesignup.dart';
import 'package:get/get.dart';

abstract class FvirFiyCodeSignControllar extends GetxController {
  checkCode();

  goToSuccess(String virFiyCode);

  reSend();
}

class FvirFiyCodeSignUPControllarImp extends FvirFiyCodeSignControllar {
  VirfiyCode virfiycode=VirfiyCode(Get.find());
  
  

  String? email;

  StatusRequest statusRequest=StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccess(String virFiyCode) async{
    statusRequest = StatusRequest.loading;
  update();
    var response = await virfiycode.postDataa(
      
      email!,
      virFiyCode,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
            Get.offNamed(AppRoots.succesSignUp);

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
   email= Get.arguments['email'];
    super.onInit();
  }

  ondispose() {
    super.dispose();
  }
  
  @override
  reSend() {
     virfiycode.reSendData(
      
      email!
      //virFiyCode,
    );
  }
}
