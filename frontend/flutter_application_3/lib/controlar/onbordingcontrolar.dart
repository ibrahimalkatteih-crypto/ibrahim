import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/static/static.dart';
import 'package:get/get.dart';

abstract class OnBordingControlar extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBordingControlarImp extends OnBordingControlar {
  late PageController pageController;
  int currentPage = 0;

  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage >= OnBordingList.length) {
      myServices.sharedPreferences.setString("step", '1');
      Get.offAllNamed(AppRoots.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: Duration(microseconds: 900),
        curve: Curves.easeInOut,
      );
    }

    update();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage);
    super.onInit();
  }
}
