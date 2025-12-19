import 'dart:math';

import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/data/datasourse/remote/allUsers.dart';
import 'package:admin_ecommers/data/model/deliveryModel.dart';
import 'package:admin_ecommers/data/model/usersModel.dart';
import 'package:get/get.dart';

class AllUsersController extends GetxController {
  AllUsers allUsers = AllUsers(Get.find());

  List<UsersModel> users = [];
  List<DeliveryModel> delivery = [];
  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await allUsers.getDataa();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List userBody = response['users']['data'];
        List deliveryBody = response['delivary']['data'];
        users.addAll(userBody.map((e) => UsersModel.fromJson(e)));
        delivery.addAll(deliveryBody.map((e) => DeliveryModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
