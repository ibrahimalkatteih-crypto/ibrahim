import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/color.dart';

class CardDileveryType extends StatelessWidget {
  final String title;
  final String imageName;
  final bool isActive;

  const CardDileveryType({super.key, required this.title, required this.imageName, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: isActive? ColorApp.seconryColor:null,
        border: Border.all(color: ColorApp.seconryColor),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageName, width: 90, height: 90),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: !isActive? const Color.fromARGB(244, 135, 44, 44):Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
