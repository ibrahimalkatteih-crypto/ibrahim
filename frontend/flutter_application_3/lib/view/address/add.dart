import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/address/addController.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressAddController());

    return Scaffold(
      appBar: AppBar(title: const Text("Add New Address")),
      body: Container(
        child: GetBuilder<AddressAddController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (controller.option != null)
                        FlutterMap(
                          mapController: controller.mapController,
                          options: controller.option!,

                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.ibrahim.myapp',
                            ),
                            MarkerLayer(markers: controller.markers),
                          ],
                        ),
                      Positioned(
                        bottom: 10,
                        child: MaterialButton(
                          minWidth: 200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ), 
                          ),
                          onPressed: () {
                            controller.goToAddressDetails();
                          },
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text("completion",style: TextStyle(fontSize: 17),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   Get.toNamed(AppRoots.addressAdd);
      // },child: Icon(Icons.add),),
    );
  }
}



//'https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',