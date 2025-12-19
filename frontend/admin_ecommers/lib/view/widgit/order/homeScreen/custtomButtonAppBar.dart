import 'package:admin_ecommers/contoller/orders/homeScreenCOntroller.dart';
import 'package:admin_ecommers/view/widgit/order/homeScreen/custtomAppBar.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CusttomBottumAppBarHome extends GetView<OrderScreenControllerImp> {
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
                (int index) =>  
                CusttomButtomAppBar(
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