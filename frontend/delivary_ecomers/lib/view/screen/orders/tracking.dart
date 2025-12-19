import 'package:delivary_ecomers/contoller/orders/detailsController.dart';
import 'package:delivary_ecomers/contoller/trackiingController.dart';
import 'package:delivary_ecomers/core/class/handlingDataView.dart';
import 'package:delivary_ecomers/core/constant/colorApp.dart';
import 'package:delivary_ecomers/core/function/getDecodePoliLine.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingController trackingController = Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(title: Text("Tracking")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<TrackingController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                
                   Expanded(
                     child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        
                        width: double.infinity,
                        child: FlutterMap(
                          mapController: controller.mapController,
                          options: controller.option,
                     
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.ibrahim.myapp',
                            ),
                            MarkerLayer(markers: controller.markers),
                            PolylineLayer(polylines: polylineSet.toList(),),
                            
                          ],
                        
                        ),
                      ),
                   ),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
