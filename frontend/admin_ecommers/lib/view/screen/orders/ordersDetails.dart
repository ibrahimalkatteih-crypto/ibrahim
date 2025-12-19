import 'package:admin_ecommers/contoller/orders/detailsController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  "Item",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorApp.seconryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "quanity",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorApp.seconryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),

                                Text(
                                  "Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorApp.seconryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                SizedBox(height: 5, child: Divider(height: 2)),
                                SizedBox(height: 5, child: Divider(height: 2)),
                                SizedBox(height: 5, child: Divider(height: 2)),
                              ],
                            ),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(
                                children: [
                                  Text(
                                    controller.data[index].itemsName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      // color: ColorApp.seconryColor,
                                      //    fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller.data[index].itemsCount
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      // color: ColorApp.seconryColor,
                                      //  fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    controller.data[index].itemsPrice
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      // color: ColorApp.seconryColor,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Price : ${controller.orderModel.orderTotalPrice}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorApp.seconryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                if (controller.orderModel.orderType == 0)
                  Card(
                    child: Container(
                      child: ListTile(
                        title: Text(
                          "Address",
                          style: TextStyle(
                            color: ColorApp.seconryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${controller.orderModel.addressCity} / ${controller.orderModel.addressStreet}",
                        ),
                      ),
                    ),
                  ),
                if (controller.orderModel.orderType == 0)
                  Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      height: 300,
                      width: double.infinity,
                      child: FlutterMap(
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
