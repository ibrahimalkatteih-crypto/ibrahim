import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/homecontrollar.dart';
import 'package:get/get.dart';

class Custtomcardhome extends GetView<HomeControllarImp> {
  final String title;
  final String body;
  const Custtomcardhome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),

      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(244, 191, 83, 83),
            ),
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              subtitle: Text(
                body,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: controller.lang=='en'?-30:null,
            left: controller.lang=='ar'?-30:null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: const Color.fromARGB(244, 166, 53, 53),
                borderRadius: BorderRadius.circular(80),
              ),
              margin: EdgeInsets.only(left: 20, top: 20),
            ),
          ),
        ],
      ),
    );
  }
}
