import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/homeScreenController.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';

import 'package:flutter_application_3/view/widget/homeScreen/bottomAppBar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            0,
          ),
          backgroundColor: const Color.fromARGB(244, 214, 37, 37),

          onPressed: () {
            Get.toNamed(AppRoots.cart);
          },
          focusColor: Colors.red,
          child: Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
