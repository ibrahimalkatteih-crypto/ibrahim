import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/onbordingcontrolar.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/data/datasourse/static/static.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DotControlar extends StatelessWidget {
  const DotControlar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControlarImp>(
      builder: (OnBordingControlarImp controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(OnBordingList.length, (i) {
              return AnimatedContainer(
                margin: EdgeInsets.only(right: 5),
                duration: Duration(microseconds: 900),
                width: controller.currentPage == i ? 20 : 5,
                height: 6,
                decoration: BoxDecoration(
                  color: controller.currentPage == i
                      ? ColorApp.primaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
