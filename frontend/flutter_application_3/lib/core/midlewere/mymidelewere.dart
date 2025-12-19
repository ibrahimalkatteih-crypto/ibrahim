import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:get/get.dart';

class MyMiddleWere extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == "2") {
      return RouteSettings(name: AppRoots.home);
    }
    if (myServices.sharedPreferences.getString('step') == "1") {
      return RouteSettings(name: AppRoots.login);
    }
  }
}
