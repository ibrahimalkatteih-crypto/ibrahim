import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/localiztion/changelocal.dart';
import 'package:flutter_application_3/view/widget/language/custtembottomLang.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';

class Languages extends GetView<LocalControlar> {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 20),
            CusttemBottemLan(
              textButton: 'ar',
              onPressed: () {
                controller.changLang('ar');
                Get.offAllNamed(AppRoots.onboarding);
              },
            ),
            SizedBox(height: 20),
            CusttemBottemLan(
              textButton: 'en',
              onPressed: () {
                controller.changLang('en');
                Get.offAllNamed(AppRoots.onboarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
