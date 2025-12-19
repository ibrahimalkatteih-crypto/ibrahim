
import 'package:admin_ecommers/contoller/auth/virfyCodeLogController.dart';
import 'package:admin_ecommers/core/class/handlingDataView.dart';
import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:admin_ecommers/view/widgit/auth/custtomButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VirfyCodeLog extends StatelessWidget {
  const VirfyCodeLog({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> myKey = GlobalKey<FormState>();
    Get.put(VirfyCodeLogControllerImp());
    return Scaffold(
      body: GetBuilder<VirfyCodeLogControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            color: ColorApp.colorLog,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    '13'.tr,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Text(
                    '11'.tr,
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
                      OtpTextField(
                        fieldWidth: 50,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        numberOfFields: 5,
                        borderColor: Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.goToLogin(verificationCode);
                        }, // end onSubmit
                      ),
                      SizedBox(height: 20),
                      CusttomButtonAuth(
                        onPressed: () {
                          controller.resend();
                        },
                        name: "41".tr,
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
