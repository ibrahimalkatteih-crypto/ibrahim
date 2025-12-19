import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:flutter/material.dart';

class CusttomBotoonImageGlobal extends StatelessWidget {
  final Function() onPressed;
  final String imageName;
  const CusttomBotoonImageGlobal({super.key, required this.onPressed, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.upload_file, color: Colors.white),
      label: Text(imageName, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorApp.seconryColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // يخلي الزر بزوايا مستديرة
        ),
      ),
    );
  }
}
