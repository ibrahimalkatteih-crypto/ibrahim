import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:get/get.dart';

class CusttomTextAuth extends StatelessWidget {
  final String tra;
  final void Function() onTap;

  const CusttomTextAuth({super.key, required this.tra, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        tra.tr,
        style: TextStyle(color: ColorApp.pblack, fontSize: 17),
      ),
    );
  }
}
