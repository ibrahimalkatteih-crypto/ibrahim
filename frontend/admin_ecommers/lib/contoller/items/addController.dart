import 'dart:io';

import 'package:admin_ecommers/contoller/items/viewController.dart';
import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/core/function/upload_file.dart';
import 'package:admin_ecommers/data/datasourse/remote/catigories/viewData.dart';
import 'package:admin_ecommers/data/datasourse/remote/items/addData.dart';
import 'package:admin_ecommers/data/model/catigoriesModel.dart';
import 'package:admin_ecommers/data/model/itemsModel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemsController extends GetxController {
  AddDataItems addDataItems = AddDataItems(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController? dropDownName;
  TextEditingController? dropDownId;

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

  File? file;
  List<CatigorisModel> datacat = [];
  Map<String, int> dataCatigries = {};

  List<SelectedListItem<String>> selectedList = [];

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

  addData() async {
    if (file == null) {
      Get.snackbar("Erorr", "60".tr);
    }

    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name!.text,
        "name_ar": nameAr!.text,
        "desc": desc!.text,
        "decsAR": descAr!.text,
        "count": count!.text,
        "price": price!.text,
        "descount": descount!.text,
        "catid":catId!.text,
        "date_now": DateTime.now().toString(),
      };

      var response = await addDataItems.getDataa(data, file!);

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.snackbar("success", "43".tr);
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
    dropDownName = TextEditingController();
    dropDownId = TextEditingController();
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    descount = TextEditingController();
    catId = TextEditingController();
    catName = TextEditingController();
    getDataCatigories();

    super.onInit();
  }

  // showDropDownList(context) {
  //   DropDownState<String>(
  //     dropDown: DropDown<String>(
  //       data: <SelectedListItem<String>>[
  //         SelectedListItem<String>(data: 'Tokyo'),
  //         SelectedListItem<String>(data: 'New York'),
  //         SelectedListItem<String>(data: 'London'),
  //       ],
  //       onSelected: (selectedItems) {

  //         List<String> list = [];
  //         for (var item in selectedItems) {
  //           list.add(item.data);
  //         }
  //         dropDownName!.text=list.toString();
  //         print("${dropDownName!.text}============================");
  //         ScaffoldMessenger.of(
  //           context,
  //         ).showSnackBar(SnackBar(content: Text(list.toString())));
  //       },
  //     ),
  //   ).showModal(context);
  // }
}
