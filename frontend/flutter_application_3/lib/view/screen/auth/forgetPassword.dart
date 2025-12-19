import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/auth/forgetpassword.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/core/myfunctions/validinput.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/custtomButton.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/textform.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();
  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>ForgetPasswordImp());
    return Scaffold(
      body:GetBuilder<ForgetPasswordImp>(builder: (controller) =>  
      HandlingDataRequest(statusRequest: controller.statusRequest,widget: 
      Container(
        padding: EdgeInsets.all(20),
        color: ColorApp.colorLog,
        child: ListView(
          children: [
            Center(
              child: Text(
                '3'.tr,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(35),
              child: Text(
                '7'.tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                // softWrap: true,
                // overflow: TextOverflow.visible,
              ),
            ),

            SizedBox(height: 20),
            Form(
              key: myKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextfieled(
                    nameField: "Email",
                    textcontroller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email),
                    valid: (val) {
                      return validInput(val!, 5, 100, 'email');
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red,
                    ),
                    child: MyCusttomButtun(
                      onPressed: () {
                        if (myKey.currentState!.validate()) {
                          controller.goToVerfiyCode();
                        }
                      },
                      nameButton: '9'.tr,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )))
    );
  }
}
