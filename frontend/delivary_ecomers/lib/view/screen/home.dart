import 'package:delivary_ecomers/core/service/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    return Scaffold(
      body: Center(child: Text(myServices.sharedPreferences.getString('phone')!)),
    );
  }
}