import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/getpolyline.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/model/orderModel.dart';
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

  Future<void> getCurrentLocation() async {
    point = LatLng(orderModel.addressLat, orderModel.addressLang);
    option = MapOptions(initialCenter: point, initialZoom: 14.5);

    update();

    markers.add(
      Marker(
        key: Key("source"),
        point: point,
        width: 40,
        height: 40,
        child: Icon(Icons.location_pin, color: Colors.red),
      ),
    );
  }

  getLocationDilevery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(orderModel.orderId.toString())
        .snapshots()
        .listen((event) {
          if (event.exists) {
            String lat = event.get("lat");
            String long = event.get("lang");
            distnionPoint = LatLng(double.parse(lat), double.parse(long));
            _updateMarker(distnionPoint);
          }
        });
  }

  void _updateMarker(LatLng position) {
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

  getData(data) {}

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
    print("$point point=============================");
    print("$distnionPoint distination=============================");
    // initPolyLine();
    getLocationDilevery();
    getCurrentLocation();
    super.onInit();
  }

  @override
  void onClose() {
    // تنظيف الـ Stream لما يتسكر الـ Controller
    positionStream?.cancel();
    // timer?.cancel();
    super.onClose();
  }
}
