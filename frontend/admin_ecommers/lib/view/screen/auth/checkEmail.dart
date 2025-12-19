
import 'package:admin_ecommers/contoller/auth/checkEmailController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:admin_ecommers/core/function/validate.dart';
import 'package:admin_ecommers/view/widgit/auth/custtomButtonAuth.dart';
import 'package:admin_ecommers/view/widgit/auth/custtomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(CheckEmailControllerImp());
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return Scaffold(
      body: GetBuilder<CheckEmailControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            color: ColorApp.colorLog,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "3".tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "7".tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),

                Form(
                  key: key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CusttomTextFormField(
                          textController: controller.email!,
                          name: "email",
                          prefixIcon: Icons.email,
                          validator: (value) {
                            return validInput(value!, 3, 20, "email");
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      CusttomButtonAuth(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            controller.checkEmail();
                          }
                        },
                        name: "9".tr,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
