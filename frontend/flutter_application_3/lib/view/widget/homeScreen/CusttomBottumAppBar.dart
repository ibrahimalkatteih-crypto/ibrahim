import 'package:flutter/material.dart';

class CusttomButtomAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color colorIcon;
  final IconData icon;

  const CusttomButtomAppBar({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.minPositive,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: colorIcon,),
          Text(title, style: TextStyle(color: colorIcon)),
        ],
      ),
    );
  }
}
