import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/color.dart';

class CardPaymentMethod extends StatelessWidget {

  final String title;
  final bool isActive;
  const CardPaymentMethod({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 10,),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: isActive? ColorApp.seconryColor:const Color.fromARGB(244, 233, 174, 174),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                title,
                style: TextStyle(
                  color:!isActive? ColorApp.pblack:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1,
                ),
              ),
            );
  }
}