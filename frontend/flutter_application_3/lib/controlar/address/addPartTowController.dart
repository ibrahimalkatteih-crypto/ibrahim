import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/addressData.dart';

import 'package:get/get.dart';

class AddressAddPartTowController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List data =[

  ];

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;
  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  AddAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addDataa(
      myServices.sharedPreferences.getString('id')!,
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoots.home);
        } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
