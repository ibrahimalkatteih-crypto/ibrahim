
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/orders/trackingController.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/core/myfunctions/getpolyline.dart';

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
