import 'package:flutter_application_3/core/constant/rootsname.dart';

import 'package:get/get.dart';

abstract class SuccesResetPass extends GetxController {
  goToResetPassword();
}

class SuccesResetPassImp extends SuccesResetPass {
  
  late String email;
  @override
  goToResetPassword() {
    Get.offNamed(AppRoots.resetpassword,arguments: {'email':email});
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
