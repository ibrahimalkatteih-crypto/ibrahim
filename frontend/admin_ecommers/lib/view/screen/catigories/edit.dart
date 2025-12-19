import 'package:admin_ecommers/contoller/catigories/editController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';

import 'package:admin_ecommers/core/function/validate.dart';
import 'package:admin_ecommers/core/sharid/CusttomBotoonImageGlobal.dart';
import 'package:admin_ecommers/core/sharid/custtomTextFormGlobal.dart';
import 'package:admin_ecommers/linkapi.dart';
import 'package:admin_ecommers/view/widgit/auth/custtomButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditCatigories extends StatelessWidget {
  const EditCatigories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditCatigoriesController());
    return Scaffold(
      appBar: AppBar(title: Text("Edit Catigories")),
      body: GetBuilder<EditCatigoriesController>(
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
                  controller.file != null
                      ? SvgPicture.file(
                          controller.file!,
                          height: 60,
                          colorFilter: ColorFilter.mode(
                            ColorApp.seconryColor,
                            BlendMode.srcIn,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(4),
                          child: SvgPicture.network(
                            "${AppLink.imageCategories}/${controller.catigorisModel!.categoriesImage}",
                            height: 60,
                            colorFilter: ColorFilter.mode(
                              ColorApp.seconryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),

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
    );
  }
}
