import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/color.dart';

class CusttemBottemLan extends StatelessWidget {
  final String textButton;
  final void Function() onPressed;
  const CusttemBottemLan({super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(500)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(textButton),
        color: ColorApp.primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
