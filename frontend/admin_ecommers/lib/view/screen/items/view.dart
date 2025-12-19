import 'package:admin_ecommers/contoller/items/viewController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:admin_ecommers/core/service/myservices.dart';
import 'package:admin_ecommers/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ViewItems extends StatelessWidget {
  const ViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    ViewItemsController controller = Get.put(ViewItemsController());
    return Scaffold(
      appBar: AppBar(title: Text("Items")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToAddPage();
        },
        shape: CircleBorder(),
        backgroundColor: ColorApp.seconryColor,
        child: Icon(Icons.add, color: ColorApp.pblack),
      ),
      body: GetBuilder<ViewItemsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: PopScope(
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  controller.myBack();
                });
              }
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Card(
                  child: InkWell(
                    onTap: () {
                      controller.goToEdit(controller.data[index]);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Stack(
                              children: [
                                Image.network(
                                  "${AppLink.imageItems}/${controller.data[index].itemsImage}",
                                  height: 80, 
                                  width: 80,
                                ),
                                Positioned(
                                  top: 6,
                                  right: 6,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          controller.data[index].itemsActive == 1
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      controller.data[index].itemsActive == 1
                                          ? '64'.tr
                                          : '65'.tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ListTile(
                            trailing: 
                                IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Note!!!",
                                      middleText: "49".tr,
                                      onCancel: () {},
                                      onConfirm: () {
                                        controller.deleteData(
                                          controller.data[index].itemsId
                                              .toString(),
                                          controller.data[index].itemsImage,
                                        );
                                        Get.back();
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                            //     IconButton(
                            //       onPressed: () {
                            //         controller.goToEdit(controller.data[index]);
                            //       },
                            //       icon: Icon(Icons.edit),
                            //     ),
                            //   ],
                            // ),
                    
                            title:
                                myServices.sharedPreferences.getString('lang') ==
                                    'en'
                                ? Text(controller.data[index].itemsName)
                                : Text(controller.data[index].itemsNameAr),
                            subtitle:
                                myServices.sharedPreferences.getString('lang') ==
                                    'en'
                                ? Text(controller.data[index].categoriesName)
                                : Text(controller.data[index].categoriesNameAr),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // child: Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SvgPicture.network(
                  //       "${AppLink.imageCategories}/${controller.data[index].categoriesImage}",
                  //       width: 100,
                  //       colorFilter: ColorFilter.mode(
                  //         ColorApp.seconryColor,
                  //         BlendMode.srcIn,
                  //       ),
                  //     ),
                  //     SizedBox(height: 50,)
                  //   ],
                  // ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
