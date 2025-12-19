import 'package:delivary_ecomers/contoller/orders/archiveCOntroller.dart';
import 'package:delivary_ecomers/core/class/handlingDataView.dart';
import 'package:delivary_ecomers/core/constant/appRoots.dart';
import 'package:delivary_ecomers/core/constant/colorApp.dart';
import 'package:delivary_ecomers/data/model/orderModel.dart';
import 'package:delivary_ecomers/view/widgit/order/dialogreting.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    OrderArchivesController controller = Get.put(OrderArchivesController());
    return Scaffold(
      appBar: AppBar(title: Text("Archive")),
      body: GetBuilder<OrderArchivesController>(
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

class CardOrdersList extends GetView<OrderArchivesController> {
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
                Text(Jiffy.parse("${orderModel.orderDatetime}",).fromNow(), // 5 years ago

                  style: TextStyle( fontSize: 12),)
              ],
            ),
            Divider(),
            Text(
              "Order Type : ${controller.printTypeOrder(orderModel.orderType.toString())}",
            ),
            Text("Order Price : ${orderModel.orderPrice}"),
            Text("Delivery Price : ${orderModel.orderPriceDelivery}"),
            Text(
              "Payment  Method : ${controller.printPaymentMethod(orderModel.orderPaymentMethod.toString())}",
            ),
            Text(
              "Order  Status : ${controller.printOrderStatus(orderModel.orderStatus.toString())}",
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
                    Get.toNamed(AppRoots.orderDetails,arguments: {
                      "ordersModel":orderModel
                    });
                  },
                  color: ColorApp.primaryColor,
                  textColor: ColorApp.pblack,
                  child: Text("Details"),
             
                ),

                 if(orderModel.orderRating==0)
                Spacer(),
                 if(orderModel.orderRating==0)
                MaterialButton(
                  onPressed: () {
                    showDialogReing(context,orderModel.orderId.toString());
                  },
                  color: ColorApp.primaryColor,
                  textColor: ColorApp.pblack,
                  child: Text("rating"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
