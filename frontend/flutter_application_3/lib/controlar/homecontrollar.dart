import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/home_data.dart';
import 'package:flutter_application_3/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class HomeControllar extends SerchMixController {
  initialData();
  getData();
  gotoItems(List categoreis, int selectedCat, String categoreisId);
}

class HomeControllarImp extends HomeControllar {
  HomeData homeData = HomeData(Get.find());

  MyServices myServices = Get.find();

  String? usersId;

  String? username;

  String? lang;

  List data = [];

  List categories =[ ];

  List items = [];

  List textSetting=[];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getDataa();

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        textSetting.addAll(response['textsetting']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData()  {
    usersId = myServices.sharedPreferences.getString('id');
    username = myServices.sharedPreferences.getString('username');
    lang = myServices.sharedPreferences.getString('lang');
    
  }

  @override
  gotoItems(List categoreis, int selectedCat, String categoreisId) {
    Get.toNamed(
      AppRoots.items,
      arguments: {
        'categoreis': categoreis,
        'selectedCat': selectedCat,
        'categories_id': categoreisId,
      },
    );
  }

  goToProdactDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoots.prodactDetails, arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    serch = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }
}

class SerchMixController extends GetxController {
  HomeData homeData = HomeData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<ItemsModel> listData = [];

  TextEditingController? serch;
  bool isSerch = false;
  checkSerch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSerch = false;
    }
    update();
  }

  onSerch() {
    serchData();
    isSerch = true;
    update();
  }

  serchData() async {
    listData = [];
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.serchDataa(serch!.text);

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseBody = response['data'];
        listData.addAll(responseBody.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  
}
