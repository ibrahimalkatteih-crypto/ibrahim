import 'package:delivary_ecomers/contoller/trackiingController.dart';
import 'package:delivary_ecomers/core/class/statusRequest.dart';
import 'package:delivary_ecomers/core/function/handlingData.dart';
import 'package:delivary_ecomers/core/service/myservices.dart';
import 'package:delivary_ecomers/data/datasourse/remote/orders/pindingData.dart';
import 'package:delivary_ecomers/data/model/orderModel.dart';

import 'package:get/get.dart';

class OrderPindingsController extends GetxController {
  PindingData orderPindingData = PindingData(Get.find());
  MyServices myServices = Get.find();

  List<OrderPendingModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  printTypeOrder(String val){
    if(val=='0'){
      return "Delivery";
    }else{
      return "resive";
    }
  }
  printPaymentMethod(String val){
    if(val=='0'){
      return "Cash";
    }else{
      return "Payment Card";
    }
  }
  printOrderStatus(String val){
    if(val=='0'){
      return "await Approvail";
    }else if(val=="1"){
      return "the order is being prepared";
    }
    else if(val=="2"){
      return "Delivery";
    }else if(val=="3"){
      return "on the way";
    }else{
      return "Archive";
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    data=[];
    update();

    var response = await orderPindingData.getDataa(
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List dataBody=response['data'];
        data.addAll(dataBody.map((e)=>OrderPendingModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  approveOrder(String usersId,String orderId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await orderPindingData.approveData(
      myServices.sharedPreferences.getString("id")!,
      usersId,orderId
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // TrackingController trackiingController =Get.put(TrackingController());
        Get.snackbar("note...", "success approve order");
        getData();   
        
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }





  refreshOrder(){
    data=[];
    getData();
    update();
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
