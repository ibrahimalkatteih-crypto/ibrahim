
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:admin_ecommers/core/localization/changLocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Languages extends GetView<LocalControlar> {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '1'.tr,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 200,
              child: MaterialButton(
                color: ColorApp.primaryColor,
                onPressed: () {
                  controller.changLang('en');
                  Get.toNamed(AppRoots.login);
                },
                child: Text(
                  "En",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: 200,
              child: MaterialButton(
                color: ColorApp.primaryColor,
                onPressed: () {
                  controller.changLang('ar');
                  Get.toNamed(AppRoots.login);
                },
                child: Text(
                  "Ar",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
