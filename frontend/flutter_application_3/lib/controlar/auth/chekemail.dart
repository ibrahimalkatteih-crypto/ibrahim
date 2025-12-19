import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:get/get.dart';

abstract class ChekEmailControllar extends GetxController {

  checkemail();

  goToSuccessSignUp();
}

class CheckEmailImp extends ChekEmailControllar {
  late TextEditingController email ;

  @override
  checkemail() {}

  @override
  goToSuccessSignUp() {
    
    Get.toNamed(AppRoots.verifiycode);
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
