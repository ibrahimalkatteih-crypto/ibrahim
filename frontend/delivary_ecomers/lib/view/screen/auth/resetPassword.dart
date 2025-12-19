import 'package:delivary_ecomers/contoller/auth/resetPasswordController.dart';
import 'package:delivary_ecomers/core/class/handlingDataView.dart';
import 'package:delivary_ecomers/core/constant/colorApp.dart';
import 'package:delivary_ecomers/core/function/validate.dart';
import 'package:delivary_ecomers/view/widgit/auth/custtomButtonAuth.dart';
import 'package:delivary_ecomers/view/widgit/auth/custtomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ResePasswordControllerImp());
     GlobalKey<FormState> key=GlobalKey<FormState>();
    return Scaffold(
      body: GetBuilder<ResePasswordControllerImp>(
        builder: (controller) => 
        HandlingDataView(statusRequest: controller.statusRequest, widget: 
        
        Container(
          color: ColorApp.colorLog,
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "10".tr,
                  style: TextStyle(
                    color: ColorApp.pblack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Center(
                child: Text(
                  "12".tr,
                  style: TextStyle(color: ColorApp.pblack, fontSize: 20),
                ),
              ),

              SizedBox(height: 20),

              Form(
                key: key,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CusttomTextFormField(
                        textController: controller.password!,
                        name: "password",
                        prefixIcon: Icons.password,
                        validator: (value) {
                          return validInput(value!, 8, 20, "password");
                        },
                        onPressedIcon: () {
                          controller.visiblePassword();
                        },
                        obscureText: controller.isShowPassword,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CusttomTextFormField(
                        textController: controller.suPassword!,
                        name: "re password",
                        prefixIcon: Icons.password,
                        validator: (value) {
                          if(controller.password!.text!=controller.suPassword!.text){
                            return "38".tr;
                          }else{
                          return validInput(value!, 8, 20, "password");}
                        },
                        onPressedIcon: () {
                          controller.visiblePassword();
                        },
                        obscureText: controller.isShowPassword,
                      ),
                    ),

                    SizedBox(height: 20),
                    CusttomButtonAuth(onPressed: () {
                      if(key.currentState!.validate()){

                        controller.goToSucces();
                      }
                    }, name: "10".tr),
                  ],
                ),
              ),
            ],
          ),
        ),),
      ),
    );
  }
}
