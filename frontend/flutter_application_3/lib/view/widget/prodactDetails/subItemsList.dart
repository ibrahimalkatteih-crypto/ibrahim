import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/prodactControllerDetails.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProdactDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            alignment: Alignment.center,
            height: 60,
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 47, 85, 151)),
              borderRadius: BorderRadius.circular(10),
              color: controller.subItems[index]['active'] == 0
                  ? null
                  : Color.fromARGB(255, 47, 85, 151),
            ),
            child: Text(
              "${controller.subItems[index]['name']}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: controller.subItems[index]['active'] == 0
                    ? Color.fromARGB(255, 47, 85, 151)
                    : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
