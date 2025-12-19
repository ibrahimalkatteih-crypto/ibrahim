import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/homeScreenController.dart';
import 'package:flutter_application_3/view/widget/homeScreen/CusttomBottumAppBar.dart';
import 'package:get/get.dart';

class CusttomBottumAppBarHome extends GetView<HomeScreenControllerImp> {
  const CusttomBottumAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 7,

      child: Row(
      
        children: [
          ...List.generate(
            controller.listPage.length + 1,
            (int index) => index == 2
                ? Spacer()
                : CusttomButtomAppBar(
                    onPressed: () {
                      controller.changePage(index > 2 ? index - 1 : index);
                    },
                    icon: controller
                        .buttomAppBar[index > 2 ? index - 1 : index]['icon'],
                    title: controller
                        .buttomAppBar[index > 2 ? index - 1 : index]['title'],
                    colorIcon:
                        controller.currentPage ==
                            (index > 2 ? index - 1 : index)
                        ? Colors.blue
                        : Colors.black54,
                  ),
          ),
        ],
      ),
    );
  }
}
