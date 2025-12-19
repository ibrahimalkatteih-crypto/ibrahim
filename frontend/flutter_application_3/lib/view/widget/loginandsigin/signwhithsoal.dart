import 'package:flutter/material.dart';

class SigWithSoal extends StatelessWidget {
  final String image;
  const SigWithSoal({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // هذا هو المفتاح لجعلها دائرية
          color: Colors.white,
        ),
        child: ClipOval(
          child: Image.asset(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
