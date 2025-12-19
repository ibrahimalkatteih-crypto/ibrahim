import 'package:admin_ecommers/contoller/catigories/addController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';

import 'package:admin_ecommers/core/function/validate.dart';
import 'package:admin_ecommers/core/sharid/CusttomBotoonImageGlobal.dart';
import 'package:admin_ecommers/core/sharid/custtomTextFormGlobal.dart';
import 'package:admin_ecommers/view/widgit/auth/custtomButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddCatigories extends StatelessWidget {
  const AddCatigories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCatigoriesController());
    return Scaffold(
      appBar: AppBar(title: Text("Add Catigories")),
      body: GetBuilder<AddCatigoriesController>(
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
                    prefixIcon: Icons.category,
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
                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: CusttomBotoonImageGlobal(
                      imageName: '47'.tr,
                      onPressed: () {
                        controller.chosesImage();
                      },
                    ),
                  ),
                  if (controller.file != null)
                    SvgPicture.file(controller.file!),

                  SizedBox(height: 10),
                  CusttomButtonAuth(name: "46".tr, onPressed: () {
                    controller.addData();
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
