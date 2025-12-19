import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddressAddController extends GetxController {
  final mapController = MapController();
  StatusRequest statusRequest = StatusRequest.loading;

  Position? position;

  MapOptions? option;

  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng point) {
    markers = [];
    markers.add(
      Marker(
        point: point,
        width: 40,
        height: 40,
        child: Icon(Icons.location_pin, color: Colors.red),
      ),
    );
    lat = point.latitude;
    long = point.longitude;
    update();
  }

  getCurrentLoction() async {
    position = await Geolocator.getCurrentPosition();

    statusRequest = StatusRequest.none;

    update();
    option = MapOptions(
      initialCenter: LatLng(position!.latitude, position!.longitude),
      initialZoom: 14.5,
      onTap: (tapPosition, point) {
        addMarkers(point);
      },
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    update();
  }

  goToAddressDetails() {
    Get.toNamed(
      AppRoots.addressAddDetails,
      arguments: {'lat': lat.toString(), "long": long.toString()},
    );
  }

  @override
  void onInit() {
    getCurrentLoction();
    super.onInit();
  }
}
