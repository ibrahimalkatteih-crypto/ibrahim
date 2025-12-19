import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/screen/home.dart';
import 'package:flutter_application_3/view/screen/notifyction.dart';
import 'package:flutter_application_3/view/screen/offers.dart';
import 'package:flutter_application_3/view/screen/settings.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  List<Widget> listPage = [Home(), Notifyction(), Offers(), Settings()];

  List buttomAppBar = [
    {"title": 'Home', "icon": Icons.home},
    {"title": 'notfiction', "icon": Icons.notification_important},
    {"title": 'Offers', "icon": Icons.discount},
    {"title": 'settings', "icon": Icons.settings},
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
