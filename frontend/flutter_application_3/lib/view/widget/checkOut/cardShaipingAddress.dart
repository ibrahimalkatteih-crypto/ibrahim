import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/color.dart';

class CardShaipingAddress extends StatelessWidget {
  final String title, body;
  final bool isActive;
  const CardShaipingAddress({
    super.key,
    required this.title,
    required this.body,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? ColorApp.seconryColor : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),

      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: !isActive ? ColorApp.pblack : Colors.white),
        ),
        subtitle: Text(
          body,
          style: TextStyle(color: !isActive ? ColorApp.pblack : Colors.white),
        ),
      ),
    );
  }
}
