import 'package:flutter/material.dart';

class ButtomCoupon extends StatelessWidget {
  final String textButton;
  final void Function() onPressed;
  const ButtomCoupon({super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(500)),
      ),
      // padding: EdgeInsets.symmetric(horizontal: 100,vertical: 15),
      width: double.infinity,
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: onPressed,
        color: const Color.fromARGB(244, 207, 37, 37),
        textColor: Colors.white,
        child: Text(textButton),
      ),
    );
  }
}
