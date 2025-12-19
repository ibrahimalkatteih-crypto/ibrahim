import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/homecontrollar.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/items_data.dart';
import 'package:flutter_application_3/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SerchMixController {
  intialData();
  changeItems(int i, String catVal);
  getItems(String categoreisId);
  goToProdactDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();
  List categoreis = [];
  int? selectedCat;
  List items = [];
  String? catId;
  String? usersId;


  

  @override
  intialData() {
    categoreis = Get.arguments['categoreis'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['categories_id'];
    usersId= myServices.sharedPreferences.getString("id")!;
    getItems(catId!);
  }

  @override
  changeItems(int i, catVal) {
    selectedCat = i;
    items = [];
    getItems(catVal);
    update();
  }

  @override
  void onInit() {
    serch=TextEditingController();
    intialData();
    super.onInit();
  }

  StatusRequest statusRequest = StatusRequest.none;
  @override
  getItems(categoreisId) async {
    statusRequest = StatusRequest.loading;

    var response = await itemsData.getDataa(
      categoreisId,
      usersId!,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProdactDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoots.prodactDetails, arguments: {"itemsModel": itemsModel});
  }
}
