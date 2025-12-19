import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/color.dart';

class CardTitleType extends StatelessWidget {
  final String title;
  const CardTitleType({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: ColorApp.seconryColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
