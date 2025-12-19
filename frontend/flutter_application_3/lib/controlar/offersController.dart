import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/controlar/homecontrollar.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/data/datasourse/remote/offersData.dart';
import 'package:flutter_application_3/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class OffersController extends SerchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data =[

  ];
  
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.getDataa();

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    serch = TextEditingController();
    getData();
    super.onInit();
  }
}
