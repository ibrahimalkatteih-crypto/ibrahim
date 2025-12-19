import 'package:admin_ecommers/contoller/items/addController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';

import 'package:admin_ecommers/core/function/validate.dart';
import 'package:admin_ecommers/core/sharid/CusttomBotoonImageGlobal.dart';
import 'package:admin_ecommers/core/sharid/custtomDropDownSerch.dart';
import 'package:admin_ecommers/core/sharid/custtomTextFormGlobal.dart';
import 'package:admin_ecommers/view/widgit/auth/custtomButtonAuth.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemsController());
    return Scaffold(
      appBar: AppBar(title: Text("Add Items")),
      body: GetBuilder<AddItemsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CusttomTextFormGlobal(
                    textController: controller.name!,
                    name: '44'.tr,
                    prefixIcon: Icons.store,
                    validator: (String? value) {
                      return validInput(value!, 1, 30, "");
                    },
                  ),
                  SizedBox(height: 10),
                  CusttomTextFormGlobal(
                    textController: controller.nameAr!,
                    name: '45'.tr,
                    prefixIcon: Icons.store,
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

                  if(controller.file != null)Image.file(height: 70,width: 70,controller.file!),

                  CusttomDropDownSerch(
                    title: "61".tr,
                    listData: controller.selectedList,
                    name: controller.catName!,
                    id: controller.catId!,
                    ids: controller.dataCatigries,
                  ),

                  // TextFormField(
                  //   controller: controller.dropDownName,
                  //   cursorColor: Colors.black,
                  //   readOnly:true,
                  //   onTap:
                  //        () {
                  //           FocusScope.of(context).unfocus();
                  //           controller.showDropDownList(context);
                  //         }
                  //      ,
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.black12,
                  //     contentPadding: const EdgeInsets.only(
                  //       left: 8,
                  //       bottom: 0,
                  //       top: 0,
                  //       right: 15,
                  //     ),
                  //     hintText: "اختر القسم",
                  //     border: const OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //         width: 0,
                  //         style: BorderStyle.none,
                  //       ),
                  //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  CusttomButtonAuth(
                    name: "46".tr,
                    onPressed: () {
                      controller.addData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
