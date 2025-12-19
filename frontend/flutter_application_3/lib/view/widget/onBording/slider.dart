import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/onbordingcontrolar.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/data/datasourse/static/static.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SliderOnBording extends GetView<OnBordingControlarImp> {
  const SliderOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: OnBordingList.length,
      itemBuilder: (context, i) {
        
        return Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              OnBordingList[i].title!,
              style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: ColorApp.pblack,
          ),
            ),
            SizedBox(height: 80),
            Image.asset(
              OnBordingList[i].image!,
              width: 200,
              height: 220,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 80),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                OnBordingList[i].body!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, height: 2, color: ColorApp.gray),
              ),
            ),
            // SizedBox(height: 12), // المسافة بين النص والنقاط

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(onBordingColumn.length, (
            //     index,
            //   ) {
            //     return Container(
            //       margin: EdgeInsets.symmetric(horizontal: 4),
            //       width: 10,
            //       height: 10,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: i == index ? Colors.blue : Colors.grey,
            //       ),
            //     );
            //   }),
            // ),
          ],
        );

      },
      controller: controller.pageController
    );
  }
}
