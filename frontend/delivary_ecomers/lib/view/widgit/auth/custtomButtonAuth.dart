import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CusttomButtonAuth extends StatelessWidget {
  final void Function() onPressed;
  final String name;
  const CusttomButtonAuth({super.key, required this.onPressed, required this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.red,
      padding: EdgeInsets.all(10),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      textColor: Colors.white,
      child: Text(name, style: TextStyle(fontSize: 15)),
    );
  }
}
