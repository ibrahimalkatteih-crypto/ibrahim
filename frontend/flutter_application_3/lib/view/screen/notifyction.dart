import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/notifycationController.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:get/get.dart';

class Notifyction extends StatelessWidget {
  const Notifyction({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotifycationController());
    return Container(
      child: GetBuilder<NotifycationController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "Notifyction",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorApp.seconryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
    );
  }
}
