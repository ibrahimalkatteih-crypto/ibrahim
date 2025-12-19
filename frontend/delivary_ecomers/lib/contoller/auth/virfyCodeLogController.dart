import 'package:delivary_ecomers/core/class/statusRequest.dart';
import 'package:delivary_ecomers/core/constant/appRoots.dart';
import 'package:delivary_ecomers/core/function/handlingData.dart';
import 'package:delivary_ecomers/data/datasourse/remote/auth/virfycodeData.dart';
import 'package:get/get.dart';

abstract class VirfyCodeLogController extends GetxController{}
class VirfyCodeLogControllerImp extends VirfyCodeLogController{


  String? email;

  VirfyCodeData virfyCodeData = VirfyCodeData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  goToLogin(code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await virfyCodeData.virfyCodeData(email!, code);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoots.login);
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









  // goToResstPasswprd(){
    // Get.offAllNamed(AppRoots.login);   
  // }

  @override
  void onInit() {
    email=Get.arguments["email"];
    super.onInit();
  }
}