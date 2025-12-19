import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/orders/pindingData.dart';
import 'package:flutter_application_3/data/model/orderModel.dart';
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
    update();

    var response = await orderPindingData.getDataa(
      myServices.sharedPreferences.getString('id')!,
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

deleteData(String orderId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await orderPindingData.DeleteDataa(
      orderId
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        refreshOrder();
      } else {
        Get.snackbar("not...", "can not delete order");
        // statusRequest = StatusRequest.failure;
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
