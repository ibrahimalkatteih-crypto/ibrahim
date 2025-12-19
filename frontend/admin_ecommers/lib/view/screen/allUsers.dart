import 'package:admin_ecommers/contoller/allUsers.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllUsersController controller = Get.put(AllUsersController());
    return Scaffold(
      appBar: AppBar(title: Text("All Users")),
      body: GetBuilder<AllUsersController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Text(
                  "Users",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(controller.users[index].usersName!),
                        subtitle: Text(
                          "${controller.users[index].usersEmail!} / ${controller.users[index].usersPhone!}",
                        ),
                      ),
                    );
                  },
                ),
                //Padding(
                //    padding: const EdgeInsets.all(8.0),
                Text(
                  "Delivery",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.delivery.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          controller.delivery[index].delivaryUsername!,
                        ),
                        subtitle: Text(
                          "${controller.delivery[index].delivaryEmail!} / ${controller.delivery[index].delivaryPhone!}",
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
