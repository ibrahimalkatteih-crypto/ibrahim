import 'package:admin_ecommers/contoller/notifictionController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Notifyction extends StatelessWidget {
  const Notifyction({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotifycationController());
    return Scaffold(
      appBar: AppBar(title: Text("notifction"),),
      body: Container(
      child: GetBuilder<NotifycationController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                
                ...List.generate(controller.data.length, (index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: Column(

                        children: [
                          ListTile(
                            title: Text(
                              "${controller.data[index]['notification_title']}",
                            ),
                            subtitle: Text(
                              "${controller.data[index]['notification_body']}",
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
