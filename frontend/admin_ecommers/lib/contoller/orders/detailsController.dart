import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/data/datasourse/remote/orders/detailsData.dart';
import 'package:admin_ecommers/data/model/cartItemsModel.dart';
import 'package:admin_ecommers/data/model/orderModel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrdersDetailsController extends GetxController {
  late OrderPendingModel orderModel;
  final mapController = MapController();

  OrderDetailsData detailsData =OrderDetailsData(Get.find());

  List<CartItems> data =[

  ];

  late StatusRequest statusRequest;


  MapOptions? option;

  List<Marker>markers=[];
   late LatLng point;
  getCurrentLoction()  {
    // create a new LatLng instead of trying to set final fields
    point = LatLng(orderModel.addressLat, orderModel.addressLang);
    update();
    option = MapOptions(
      initialCenter: point,
      initialZoom: 14.5,
    );
    markers.add(
      Marker(
        point: point,
        width: 40,
        height: 40,
        child: Icon(Icons.location_pin, color: Colors.red),
      ));
  }

  @override
  void onInit() {
    orderModel = Get.arguments['ordersModel'];
    getCurrentLoction();
    getData();
    super.onInit();
  }




  

  getData()async{
   statusRequest = StatusRequest.loading;

   var response= await detailsData.getDataa(
    orderModel.orderId.toString()
   );

   statusRequest =handlingData (response);
   if(statusRequest == StatusRequest.success){
    if(response['status'] == 'success'){
      List databody=response['data'];
    data.addAll(databody.map((e)=>CartItems.fromJson(e)));

    }else{
      statusRequest =StatusRequest.failure;
    }
    
    
    
   }update();


  }
}
