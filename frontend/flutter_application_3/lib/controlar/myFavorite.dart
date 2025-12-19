import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/homecontrollar.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/myFavorite.dart';
import 'package:flutter_application_3/data/model/favoriteModel.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends SerchMixController {}

class MyFavoriteControllerImp extends MyFavoriteController {
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List<FavoriteModel> data = [];

  getData() async {
    data = [];
    statusRequest = StatusRequest.loading;

    var response = await myFavoriteData.getDataa(
      myServices.sharedPreferences.getString('id')!,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];

        //هون كان فينا نستعمل الطريقة الصحيحة ونضيفن مباشرة بس هيك مشان يتنظم الكود أفضل
        data.addAll(responseData.map((e) => FavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favId) async {
    statusRequest = StatusRequest.loading;

    var response = await myFavoriteData.deleteDataa(
      favId
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // List responseData = response['data'];

        //هون كان فينا نستعمل الطريقة الصحيحة ونضيفن مباشرة بس هيك مشان يتنظم الكود أفضل
        // data.addAll(responseData.map((e) => FavoriteModel.fromJson(e)));

        data.removeWhere((e)=>e.favoriteId.toString()==favId);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    serch=TextEditingController();
    getData();
    super.onInit();
  }
}
