import 'dart:io';

import 'package:admin_ecommers/contoller/catigories/viewController.dart';
import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/core/function/upload_file.dart';
import 'package:admin_ecommers/data/datasourse/remote/catigories/editData.dart';
import 'package:admin_ecommers/data/model/catigoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCatigoriesController extends GetxController {
  Editdata editDataCat = Editdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? name;
  TextEditingController? nameAr;

  CatigorisModel? catigorisModel;

  File? file;
  chosesImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    // if (file == null) {
    //   Get.snackbar("Erorre", "47".tr);
    // }

    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name!.text,
        "name_ar": nameAr!.text,
        "id": catigorisModel!.categoriesId.toString(),
        "image_old": catigorisModel!.categoriesImage,
      };

      var response = await editDataCat.getDataa(data, file);

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.snackbar("success", "51".tr);
          Get.offNamed(AppRoots.viewCatigories);
          ViewCatigoriesController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }

    update();
  }

  @override
  void onInit() {
    catigorisModel = Get.arguments["catigorisModel"];
    name = TextEditingController();
    nameAr = TextEditingController();
    name!.text = catigorisModel!.categoriesName;
    nameAr!.text = catigorisModel!.categoriesNameAr;

    super.onInit();
  }
}
