import 'dart:io';

import 'package:delivary_ecomers/contoller/homeScreenCOntroller.dart';
import 'package:delivary_ecomers/view/widgit/homeScreen/custtomButtonAppBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
       appBar: AppBar(title: Text("Orders"),),
        bottomNavigationBar: CusttomBottumAppBarHome(),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, Object? result) {
            if (!didPop) {
              Get.defaultDialog(
                title: "Warning",
                middleText: "Are you sure you want to exit the app?",
                onCancel: () {
                  Get.back();
                },
                onConfirm: () {
                  exit(0);
                },
              );
            }
          },
          child: controller.listPage[controller.currentPage],
        ),
      ),
    );
  }
}
