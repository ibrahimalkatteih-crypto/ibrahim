import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/core/service/myservices.dart';
import 'package:admin_ecommers/data/datasourse/remote/orders/archive.dart';
import 'package:admin_ecommers/data/model/orderModel.dart';

import 'package:get/get.dart';

class OrderArchivesController extends GetxController {
  ArchiveData archive = ArchiveData(Get.find());
  MyServices myServices = Get.find();

  List<OrderPendingModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  printTypeOrder(String val) {
    if (val == '0') {
      return "Delivery";
    } else {
      return "resive";
    }
  }

  printPaymentMethod(String val) {
    if (val == '0') {
      return "Cash";
    } else {
      return "Payment Card";
    }
  }

  printOrderStatus(String val) {
    if (val == '0') {
      return "await Approvail";
    } else if (val == "1") {
      return "the order is being prepared";
    } else if (val == "2") {
      return "Delivery";
    } else if (val == "3") {
      return "on the way";
    } else {
      return "Archive";
    }
  }

  getData() async {
    data = [];
    statusRequest = StatusRequest.loading;
    update();

    var response = await archive.getDataa(
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List dataBody = response['data'];
        data.addAll(dataBody.map((e) => OrderPendingModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    data = [];
    getData();
    update();
  }

  

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
