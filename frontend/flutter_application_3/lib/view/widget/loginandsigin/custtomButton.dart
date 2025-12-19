import 'package:flutter/material.dart';


class MyCusttomButtun extends StatelessWidget {
  final String nameButton;
  final void Function() onPressed;
  const MyCusttomButtun({
    super.key,
    required this.onPressed, required this.nameButton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,

      textColor: Colors.white,
      child: Text(nameButton),
    );
  }
}
