import 'dart:io';

import 'package:admin_ecommers/contoller/catigories/viewController.dart';
import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/core/function/upload_file.dart';
import 'package:admin_ecommers/data/datasourse/remote/catigories/addData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCatigoriesController extends GetxController {
  AddData addDataCat = AddData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? name;
  TextEditingController? nameAr;

  File? file;
  chosesImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (file == null) {
      Get.snackbar("Erorr", "47".tr);
    }

    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {"name": name!.text, "name_ar": nameAr!.text};

      var response = await addDataCat.getDataa(data, file!);

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.snackbar("success", "43".tr);
          Get.offNamed(AppRoots.viewCatigories);
          ViewCatigoriesController c=Get.find();
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
    name = TextEditingController();
    nameAr = TextEditingController();

    super.onInit();
  }
}
