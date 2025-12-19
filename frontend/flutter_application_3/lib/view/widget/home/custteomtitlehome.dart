import 'package:flutter/material.dart';

class CusttomTitleHome extends StatelessWidget {
  final String title; 
  const CusttomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(244, 108, 44, 44),
        ),
      ),
    );
  }
}
