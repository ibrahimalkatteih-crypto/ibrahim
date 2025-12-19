import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/onbordingcontrolar.dart';
import 'package:get/get.dart';

class CustemButom extends GetView<OnBordingControlarImp> {
  const CustemButom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        child: Text("lets go"),
        color: Colors.blue,
        textColor: Colors.red,
      ),
    );
  }
}
