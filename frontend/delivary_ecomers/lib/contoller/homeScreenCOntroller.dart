import 'package:delivary_ecomers/view/screen/home.dart';
import 'package:delivary_ecomers/view/screen/orders/accepted.dart';
import 'package:delivary_ecomers/view/screen/orders/pinding.dart';
import 'package:delivary_ecomers/view/screen/settings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  List<Widget> listPage = [
    OrdersPindings(),
    OrdersAccepted(),
  ];

  List buttomAppBar = [
    {"title": 'Pending', "icon": Icons.hourglass_empty},

    {"title": 'Accepted', "icon": Icons.check_circle},
  ];

  int currentPage = 0;

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
