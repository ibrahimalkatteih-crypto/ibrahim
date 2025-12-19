import 'package:delivary_ecomers/contoller/homeScreenCOntroller.dart';
import 'package:delivary_ecomers/view/widgit/homeScreen/custtomAppBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CusttomBottumAppBarHome extends GetView<HomeScreenControllerImp> {
  const CusttomBottumAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // shape: CircularNotchedRectangle(),
      notchMargin: 7,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
            controller.listPage.length,
            (int index) => CusttomButtomAppBar(
              onPressed: () {
                controller.changePage(index);
              },
              icon: controller.buttomAppBar[index]['icon'],
              title: controller.buttomAppBar[index]['title'],
              colorIcon: controller.currentPage == (index)
                  ? Colors.blue
                  : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
