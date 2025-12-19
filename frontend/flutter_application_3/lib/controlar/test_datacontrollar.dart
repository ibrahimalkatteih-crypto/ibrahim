import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/data/datasourse/remote/test_data.dart';
import 'package:get/get.dart';

class TestDataControllar extends GetxController{
  TestData testData =TestData(Get.find());

  List data =[

  ];

  late StatusRequest statusRequest;

  getData()async{
   statusRequest = StatusRequest.loading;

   var response= await testData.getDataa();

   statusRequest =handlingData (response);
   if(statusRequest == StatusRequest.success){
    if(response['status'] == 'success'){
    data.addAll(response['data']);

    }else{
      statusRequest =StatusRequest.failure;
    }
    
    
    
   }update();


  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}