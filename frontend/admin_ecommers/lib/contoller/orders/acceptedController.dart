import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/core/service/myservices.dart';
import 'package:admin_ecommers/data/datasourse/remote/orders/accepted.dart';
import 'package:admin_ecommers/data/model/orderModel.dart';

import 'package:get/get.dart';

class OrderAcceptedsController extends GetxController {
  AcceptedData orderAcceptedgData = AcceptedData(Get.find());
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
    statusRequest = StatusRequest.loading;
    update();

    var response = await orderAcceptedgData.getDataa(
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

  doneOrder(String orderId,String usersId,String orderType) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await orderAcceptedgData.prepper(
      orderId,usersId,orderType
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // List dataBody = response['data'];
        // data.addAll(dataBody.map((e) => OrderPendingModel.fromJson(e)));
        Get.snackbar("success"," orders is being prepared by Delivery");
        data=[];
        getData();
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
