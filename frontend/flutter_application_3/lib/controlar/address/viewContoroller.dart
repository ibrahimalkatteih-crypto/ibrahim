import 'dart:math';

import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/addressData.dart';
import 'package:flutter_application_3/data/model/addressModel.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();
  List<AddressModel> data =[

  ];

  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getDataa(
      myServices.sharedPreferences.getString('id')!,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseBody = response['data'];

        data.addAll(responseBody.map((e) => AddressModel.fromJson(e)));
        if(data.isEmpty){
          statusRequest=StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String addressId)async{
    addressData.deleteDataa(addressId);
    data.removeWhere((e)=>e.addressId.toString()==addressId);
    if(data.isEmpty){
      statusRequest=StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
