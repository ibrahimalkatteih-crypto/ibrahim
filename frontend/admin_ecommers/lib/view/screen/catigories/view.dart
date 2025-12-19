import 'package:admin_ecommers/contoller/catigories/viewController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:admin_ecommers/core/service/myservices.dart';
import 'package:admin_ecommers/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ViewCatigories extends StatelessWidget {
  const ViewCatigories({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Get.put(ViewCatigoriesController());
    return Scaffold(
      appBar: AppBar(title: Text("catigories")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoots.addCatigories);
        },
        shape: CircleBorder(),
        backgroundColor: ColorApp.seconryColor,
        child: Icon(Icons.add, color: ColorApp.pblack),
      ),
      body: GetBuilder<ViewCatigoriesController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: PopScope(
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                // أجل التنفيذ لآخر الـ frame حتى يخلص الـ Navigator
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
                    onTap: (){                                  controller.goToEdit(controller.data[index]);
},
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: SvgPicture.network(
                              "${AppLink.imageCategories}/${controller.data[index].categoriesImage}",
                              height: 80,
                              colorFilter: ColorFilter.mode(
                                ColorApp.seconryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ListTile(
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Note!!!",
                                      middleText: "49".tr,
                                      onCancel: () {},
                                      onConfirm: () {
                                        controller.deleteData(
                                          controller.data[index].categoriesId
                                              .toString(),
                                          controller.data[index].categoriesImage,
                                        );
                                        Get.back();
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                                
                              ],
                            ),
                    
                            title:
                                myServices.sharedPreferences.getString('lang') ==
                                    'en'
                                ? Text(controller.data[index].categoriesName)
                                : Text(controller.data[index].categoriesNameAr),
                            subtitle: Text(
                              controller.data[index].categoriesDatetime
                                  .toString(),
                            ),
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
