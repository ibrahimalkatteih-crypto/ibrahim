// import 'package:dartz/dartz_streaming.dart' hide Text;
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/favorite.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class FavoriteController extends GetxController {}

class FavoriteControllerImp extends FavoriteController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  Map isFavorite = {};
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  List data = [];

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(itemsId) async {
    statusRequest = StatusRequest.loading;

    var response = await favoriteData.addFavorite(
      myServices.sharedPreferences.getString('id')!,
      itemsId,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "title", messageText: Text("add to favorite"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavorite(itemsId) async {
    statusRequest = StatusRequest.loading;

    var response = await favoriteData.removeFavorite(
      myServices.sharedPreferences.getString('id')!,
      itemsId,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          title: "title",
          messageText: Text("delete from favorite"),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
