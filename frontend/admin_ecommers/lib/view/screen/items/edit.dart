import 'package:admin_ecommers/contoller/catigories/editController.dart';
import 'package:admin_ecommers/contoller/items/editController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';

import 'package:admin_ecommers/core/function/validate.dart';
import 'package:admin_ecommers/core/sharid/CusttomBotoonImageGlobal.dart';
import 'package:admin_ecommers/core/sharid/custtomDropDownSerch.dart';
import 'package:admin_ecommers/core/sharid/custtomTextFormGlobal.dart';
import 'package:admin_ecommers/linkapi.dart';
import 'package:admin_ecommers/view/widgit/auth/custtomButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItems extends StatelessWidget {
  const EditItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditItemsController());
    return Scaffold(
      appBar: AppBar(title: Text("Edit Items")),
      body: GetBuilder<EditItemsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(17),
            child: Form(
              key: controller.formState,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                  CusttomTextFormGlobal(
                    textController: controller.name!,
                    name: '44'.tr,
                    prefixIcon: Icons.shop,
                    validator: (String? value) {
                      return validInput(value!, 1, 30, "");
                    },
                  ),
                  SizedBox(height: 10),
                  CusttomTextFormGlobal(
                    textController: controller.nameAr!,
                    name: '45'.tr,
                    prefixIcon: Icons.category,
                    validator: (String? value) {
                      return validInput(value!, 1, 30, "");
                    },
                  ),
                  SizedBox(height: 10),

                  CusttomTextFormGlobal(
                    textController: controller.desc!,
                    name: '53'.tr,
                    prefixIcon: Icons.store,
                    validator: (String? value) {
                      return validInput(value!, 1, 100, "");
                    },
                  ),
                  SizedBox(height: 10),
                  CusttomTextFormGlobal(
                    textController: controller.descAr!,
                    name: '54'.tr,
                    prefixIcon: Icons.store,
                    validator: (String? value) {
                      return validInput(value!, 1, 100, "");
                    },
                  ),
                  SizedBox(height: 10),
                  CusttomTextFormGlobal(
                    textController: controller.price!,
                    name: '56'.tr,
                    prefixIcon: Icons.store,
                    validator: (String? value) {
                      return validInput(value!, 1, 30, "");
                    },
                  ),
                  SizedBox(height: 10),
                  CusttomTextFormGlobal(
                    textController: controller.count!,
                    name: '55'.tr,
                    prefixIcon: Icons.store,
                    validator: (String? value) {
                      return validInput(value!, 1, 30, "");
                    },
                  ),
                  SizedBox(height: 10),

                  CusttomTextFormGlobal(
                    textController: controller.descount!,
                    name: '57'.tr,
                    prefixIcon: Icons.store,
                    validator: (String? value) {
                      return validInput(value!, 1, 30, "");
                    },
                  ),
                  SizedBox(height: 10),

                  // CusttomTextFormGlobal(
                  //   textController: controller.active!,
                  //   name: '63'.tr,
                  //   prefixIcon: Icons.store,
                  //   validator: (String? value) {
                  //     return validInput(value!, 1, 30, "");
                  //   },
                  // ),
                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: CusttomBotoonImageGlobal(
                      imageName: '52'.tr,
                      onPressed: () {
                        controller.showOptionImage();
                      },
                    ),
                  ),

                  controller.file != null
                      ? Image.file(controller.file!, width: 60, height: 60)
                      : Container(
                          padding: EdgeInsets.all(4),
                          child: Image.network(
                            "${AppLink.imageItems}/${controller.itemsModel!.itemsImage}",
                            height: 60,
                          ),
                        ),

                  CusttomDropDownSerch(
                    title: "61".tr,
                    listData: controller.selectedList,
                    name: controller.catName!,
                    id: controller.catId!,
                    ids: controller.dataCatigries,
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "63".tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.pblack,
                        ),
                      ),
                      Switch(
                        value: controller.active!,
                        onChanged: (value) {
                          controller.changeActive(value);
                        },
                      ),
                    ],
                  ),

                  // RadioListTile(
                  //   title: Text("Desable"),
                  //   value: "0",
                  //   groupValue: controller.active,
                  //   onChanged: (value) {
                  //     controller.changeActive(false);
                  //   },
                  // ),
                  // RadioListTile(
                  //   title: Text("Enable"),

                  //   value: "1",
                  //   groupValue: controller.active,
                  //   onChanged: (value) {
                  //     controller.changeActive(true);
                  //   },
                  // ),
                  SizedBox(height: 20),

                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 50),
                  //   child: CusttomBotoonImageGlobal(
                  //     imageName: '47'.tr,
                  //     onPressed: () {
                  //       controller.chosesImage();
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  CusttomButtonAuth(
                    name: "50".tr,
                    onPressed: () {
                      controller.editData();
                    },
                  ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
