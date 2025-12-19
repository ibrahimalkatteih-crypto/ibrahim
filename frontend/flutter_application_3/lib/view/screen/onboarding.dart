import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/onbordingcontrolar.dart';
// import 'package:flutter_application_3/core/constant/color.dart';
// import 'package:flutter_application_3/data/datasourse/static/static.dart';
// import 'package:flutter_application_3/data/model/onbordingmodel.dart';
import 'package:flutter_application_3/view/widget/onBording/custemButom.dart';
import 'package:flutter_application_3/view/widget/onBording/dotcontrolar.dart';
import 'package:flutter_application_3/view/widget/onBording/slider.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  // List<OnBordingModel> onBordingColumn = OnBordingList;
  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControlarImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 3, child: SliderOnBording()),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  DotControlar(), SizedBox(height: 40), CustemButom()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
