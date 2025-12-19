import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/mycartController.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/mycart.dart';
import 'package:flutter_application_3/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProdactDetailsController extends GetxController {}

class ProdactDetailsControllerImp extends ProdactDetailsController {
  late ItemsModel itemsModel;
  MyCartData myCartData = MyCartData(Get.find());

  MyServices myServices = Get.find();
  //MyCartControllerImp myCartControllerImp = Get.put(MyCartControllerImp());

  List subItems = [
    {"name": "red", "id": 1, "active": 1},
    {"name": "blue", "id": 2, "active": 0},
    {"name": "black", "id": 3, "active": 0},
  ];
  StatusRequest statusRequest = StatusRequest.none;
  int countItems = 0;

  addItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myCartData.getDataa(
      myServices.sharedPreferences.getString('id')!,
      itemsId,
      
    );
    print("$response+ =========================================");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "title", messageText: Text("add to cart"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deletItems(String itemsId) async {
    statusRequest = StatusRequest.loading;

    var response = await myCartData.deleteDataa(
      myServices.sharedPreferences.getString('id')!,
      itemsId,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // List responseData = response['data'];

        //هون كان فينا نستعمل الطريقة الصحيحة ونضيفن مباشرة بس هيك مشان يتنظم الكود أفضل
        // data.addAll(responseData.map((e) => FavoriteModel.fromJson(e)));

        // data.removeWhere((e)=>e.favoriteId.toString()==favId);

        Get.rawSnackbar(title: "title", message: "تمت ازالة المنتج من السلة");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemsId) async {
    statusRequest = StatusRequest.loading;

    var response = await myCartData.getCountDataa(
      myServices.sharedPreferences.getString('id')!,
      itemsId,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        countItems = int.parse(response['data'].toString());

        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  add() {
    addItems(itemsModel.itemsId.toString());

    countItems++;
    update();
  }

  romove() {
    if (countItems > 0) {
      deletItems(itemsModel.itemsId.toString());
      countItems--;
    }
    update();
  }

  intialData() async {
    statusRequest = StatusRequest.loading;
    update();
    itemsModel = Get.arguments['itemsModel'];
    countItems = await getCountItems(itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
