import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/auth/succesresetPassord.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SuccessResitPassword extends StatelessWidget {

  SuccesResetPassImp controllar =Get.put(SuccesResetPassImp());
 

  
  late String email;
  
   SuccessResitPassword({super.key});

  final RxDouble progress = 1.0.obs;
  final int durationInSeconds = 5;

  void startTimer() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      progress.value -= 0.02;
      if (progress.value <= 0) {
        timer.cancel();
controllar.goToResetPassword();      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
  startTimer();  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '14'.tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Obx(
              () => SizedBox(
                width: 250,
                child: LinearProgressIndicator(
                  value: progress.value,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Text(
                '${(durationInSeconds * progress.value).toInt()} ثانية...',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}