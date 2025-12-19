
import 'package:admin_ecommers/view/screen/home.dart';
import 'package:admin_ecommers/view/screen/orders/accepted.dart';
import 'package:admin_ecommers/view/screen/orders/archive.dart';
import 'package:admin_ecommers/view/screen/orders/pinding.dart';
import 'package:admin_ecommers/view/screen/settings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int index);
}

class OrderScreenControllerImp extends OrderScreenController {
  List<Widget> listPage = [
    OrdersPindings(),
    OrdersAccepted(),
    OrdersArchive(),
 ];

  List buttomAppBar = [
    {"title": 'Pending', "icon": Icons.hourglass_empty},

    {"title": 'Accepted', "icon": Icons.check_circle},
    {"title": 'Archive', "icon": Icons.archive},
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
