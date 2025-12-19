import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),

      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(message, textAlign: TextAlign.center),
    );
  }
}
