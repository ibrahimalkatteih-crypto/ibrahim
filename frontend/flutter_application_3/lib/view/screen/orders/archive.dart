import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/orders/archiveCOntroller.dart';
import 'package:flutter_application_3/controlar/orders/pindingController.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/data/model/orderModel.dart';
import 'package:flutter_application_3/view/widget/order/dialogreting.dart';
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
