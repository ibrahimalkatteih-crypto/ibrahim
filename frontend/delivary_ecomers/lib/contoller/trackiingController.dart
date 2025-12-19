import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivary_ecomers/core/class/statusRequest.dart';
import 'package:delivary_ecomers/core/function/getDecodePoliLine.dart';
import 'package:delivary_ecomers/core/service/myservices.dart';
import 'package:delivary_ecomers/data/model/orderModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:latlong2/latlong.dart';

class TrackingController extends GetxController {
  late OrderPendingModel orderModel;
  final mapController = MapController();
  StreamSubscription<Position>? positionStream;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  MapOptions option = MapOptions(initialCenter: LatLng(0, 0), initialZoom: 1);

  List<Marker> markers = [];
  List<Marker> distentionmarkers = [];

  LatLng point = LatLng(34.9299, 36.7363);
  LatLng distnionPoint = LatLng(34.9296, 36.7336);

  Timer? timer;

  Future<void> getCurrentLocation() async {
    // 1. تحقق من الإذن
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // 2. اطلب الإذن
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // 3. المستخدم رفض نهائياً → لازم تفتح له صفحة الإعدادات
      print("Location permissions are permanently denied.");
      return;
    }

    point = LatLng(orderModel.addressLat, orderModel.addressLang);
    update();
    option = MapOptions(initialCenter: point, initialZoom: 14.5);

    // إضافة marker للمصدر مرة واحدة
    markers.add(
      Marker(
        key: Key("source"),
        point: point,
        width: 40,
        height: 40,
        child: Icon(Icons.location_pin, color: Colors.red),
      ),
    );

    // 4. إذا الإذن موجود → استمع للـ Stream
    positionStream = Geolocator.getPositionStream().listen(
      (Position? position) {
        if (position != null) {
          _updateMarker(position);
          print(position);
        }
      },
      onError: (error) {
        print("Location error: $error");
      },
    );
  }

  /// دالة خاصة لتحديث marker الوجهة
  void _updateMarker(Position position) {
    distnionPoint = LatLng(position.latitude, position.longitude);

    markers = [
      Marker(
        key: Key("source"),
        point: point,
        width: 40,
        height: 40,
        child: Icon(Icons.location_pin, color: Colors.red),
      ),
      Marker(
        key: Key("distination"),
        point: distnionPoint,
        width: 40,
        height: 40,
        child: Icon(Icons.location_pin, color: Colors.blue),
      ),
    ];

    mapController.move(distnionPoint, 14.5);
    update();
  }

  refreshLocation() async{
   await Future.delayed(Duration(seconds: 2), );
    timer=Timer(Duration(seconds: 10), () async{
      await FirebaseFirestore.instance
        .collection("delivary")
        .doc(orderModel.orderId.toString())
        .set({
          "lat": "${distnionPoint.latitude}",
          "lang": "${distnionPoint.longitude}",
          "delivary_id": myServices.sharedPreferences.getString("id"),
        });
    },);

   
  }

  getData(data){
    
  }


  initPolyLine() async {
    await getPolyLine(
      orderModel.addressLat,
      orderModel.addressLang,
      distnionPoint.latitude,
      distnionPoint.longitude,
    );
    update();
  }

  @override
  void onInit() {
    orderModel = Get.arguments['ordersModel'];
    refreshLocation();
    print("$point point=============================");
    print("$distnionPoint distination=============================");
    initPolyLine();
    getCurrentLocation();
    super.onInit();
  }

  @override
  void onClose() {
    // تنظيف الـ Stream لما يتسكر الـ Controller
    positionStream?.cancel();
    timer?.cancel();
    super.onClose();
  }
}
