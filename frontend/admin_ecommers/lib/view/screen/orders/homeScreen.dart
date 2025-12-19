
import 'package:admin_ecommers/contoller/orders/homeScreenCOntroller.dart';
import 'package:admin_ecommers/view/widgit/order/homeScreen/custtomButtonAppBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: Text("Orders")),
        bottomNavigationBar: CusttomBottumAppBarHome(),
        body:  controller.listPage[controller.currentPage],
      ),
    );
  }
}
