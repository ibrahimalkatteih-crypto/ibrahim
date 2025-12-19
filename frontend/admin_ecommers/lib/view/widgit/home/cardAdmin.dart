import 'package:admin_ecommers/core/constant/imageAssete.dart';
import 'package:flutter/material.dart';

class CardAdmin extends StatelessWidget {
 final String image;
 final String title;
 final Function() onTap;

  const CardAdmin({super.key, required this.image, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Image.asset(image, width: 130,fit: BoxFit.contain,)),
            Text(title),
          ],
        ),
      ),
    );
  }
}
