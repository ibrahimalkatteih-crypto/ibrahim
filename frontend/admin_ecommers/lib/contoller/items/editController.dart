import 'dart:io';

import 'package:admin_ecommers/contoller/items/viewController.dart';
import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/core/function/upload_file.dart';
import 'package:admin_ecommers/data/datasourse/remote/catigories/viewData.dart';
import 'package:admin_ecommers/data/datasourse/remote/items/editData.dart';
import 'package:admin_ecommers/data/model/catigoriesModel.dart';
import 'package:admin_ecommers/data/model/itemsModel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItemsController extends GetxController {
  EditdataItems editDataItems = EditdataItems(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? name;
  TextEditingController? nameAr;
  TextEditingController? desc;
  TextEditingController? descAr;

  TextEditingController? count; 
  // TextEditingController? active;
  TextEditingController? price;
  TextEditingController? descount;

  TextEditingController? catId;
  TextEditingController? catName;
  bool? active;


  ItemsModel? itemsModel;

  File? file;

  List<CatigorisModel> datacat = [];
  Map<String, int> dataCatigries = {};


  changeActive(bool val){
    active=val;
    update();
  }


  showOptionImage() {
    showBottomMenu(chosesImagecamera, chosesImageGallery);
  }

  chosesImagecamera() async {
    file = await imageUploadCamera();
    update();
  }

  chosesImageGallery() async {
    file = await fileUploadGallery();
    update();
  }

  List<SelectedListItem<String>> selectedList = [];
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
        "id": itemsModel!.itemsId.toString(),
        "image_old": itemsModel!.itemsImage,
        "desc": desc!.text,
        "decsAR": descAr!.text,
        "count": count!.text,
        "active": active!?"1":"0",
        "price": price!.text,
        "descount": descount!.text,
        "catid": catId!.text,
        // "date_now": DateTime.now().toString(),
      };

      var response = await editDataItems.getDataa(data, file);

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.snackbar("success", "51".tr);
          Get.offNamed(AppRoots.viewItems);
          ViewItemsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }

    update();
  }

  getDataCatigories() async {
    ViewData viewData = ViewData(Get.find());

    datacat = [];
    statusRequest = StatusRequest.loading;
    update();

    var response = await viewData.getDataa();

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseBody = response['data'];
        datacat.addAll(responseBody.map((e) => CatigorisModel.fromJson(e)));

        for (int i = 0; i < datacat.length; i++) {
          selectedList.add(SelectedListItem(data: datacat[i].categoriesName));
          dataCatigries[datacat[i].categoriesName] = datacat[i].categoriesId;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    itemsModel = Get.arguments["itemsModel"];
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();

    count = TextEditingController();
    // TextEditingController? active;
    price = TextEditingController();
    descount = TextEditingController();

    catId = TextEditingController();
    catName = TextEditingController();
    

    name!.text = itemsModel!.itemsName;
    nameAr!.text = itemsModel!.itemsNameAr;
    desc!.text = itemsModel!.itemsDesc;
    descAr!.text = itemsModel!.itemsDescAr;
    count!.text = itemsModel!.itemsCount.toString();
    price!.text = itemsModel!.itemsPrice.toString();
    descount!.text = itemsModel!.itemsDescount.toString();
    catId!.text = itemsModel!.categoriesId.toString();
    catName!.text = itemsModel!.categoriesName;
    active =itemsModel!.itemsActive.toString()=="1"? true:false;

    super.onInit();
  }
}
