import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';

alertExitApp() {
  return Get.defaultDialog(
    title: '29'.tr,
    middleText: '30'.tr,
    actions: [
      ElevatedButton(onPressed: () {
        exit(0);
      }, child: Text('confirm')),
      ElevatedButton(onPressed: () {
        Get.back();
      }, child: Text('cancel')),
    ],
  );
}
