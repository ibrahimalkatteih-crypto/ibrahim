
import 'package:admin_ecommers/contoller/orders/pindingController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:admin_ecommers/data/model/orderModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersPindings extends StatelessWidget {
  const OrdersPindings({super.key});

  @override
  Widget build(BuildContext context) {
    OrderPindingsController controller = Get.put(OrderPindingsController());
    return Container(
      child: GetBuilder<OrderPindingsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardOrdersList(orderModel: controller.data[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardOrdersList extends GetView<OrderPindingsController> {
  final OrderPendingModel orderModel;
  const CardOrdersList({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Numpber :${orderModel.orderId}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Spacer(),
                // Text( "${orderModel.orderDatetime}",
                Text(
                  Jiffy.parse(
                    "${orderModel.orderDatetime}",
                  ).fromNow(), // 5 years ago

                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Divider(),
            // Text(
            //   "Order Type : ${controller.printTypeOrder(orderModel.orderType.toString())}",
            // ),
            Text("Order Price : ${orderModel.orderPrice}"),
            Text("Delivery Price : ${orderModel.orderPriceDelivery}"),
            Text(
              "Payment  Method : ${controller.printPaymentMethod(orderModel.orderPaymentMethod.toString())}",
            ),

            Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${orderModel.orderTotalPrice}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(
                      AppRoots.orderDetails,
                      arguments: {"ordersModel": orderModel},
                    );
                  },
                  color: ColorApp.primaryColor,
                  textColor: ColorApp.pblack,
                  child: Text("Details"),
                ),
                SizedBox(width: 8),
                if (orderModel.orderStatus == 0)
                  MaterialButton(
                    onPressed: () {
                      controller.approveOrder(
                        orderModel.orderUsersId.toString(),
                        orderModel.orderId.toString(),
                      );
                    },
                    color: ColorApp.primaryColor,
                    textColor: ColorApp.pblack,
                    child: Text("Approve"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
