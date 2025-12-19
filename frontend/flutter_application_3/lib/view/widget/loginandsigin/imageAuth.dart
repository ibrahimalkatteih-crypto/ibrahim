import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/iamgeasset.dart';

class ImageAuth extends StatelessWidget {
  const ImageAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 150,
      child: Image.asset(ImageAsset.photoLogin),
    );
  }
}
