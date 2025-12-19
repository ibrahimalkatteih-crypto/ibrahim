import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/auth/login.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/constant/iamgeasset.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/core/myfunctions/alertexitapp.dart';
import 'package:flutter_application_3/core/myfunctions/validinput.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/custtmtext.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/custtomButton.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/imageAuth.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/signwhithsoal.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/textform.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final TextInputType emailType = TextInputType.emailAddress;
  final TextInputType passwordType = TextInputType.visiblePassword;

  final Widget prefixIconemail = Icon(Icons.email);
  final Widget prefixIconPassword = Icon(Icons.password);

  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControlarImp());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GetBuilder<LoginControlarImp>(
        builder: (controller) => PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              alertExitApp();
            }
          },
          child: Container(
            color: ColorApp.colorLog,
            child: SafeArea(
              child: GetBuilder<LoginControlarImp>(
                builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: ColorApp.colorLog,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            ImageAuth(),
                            SizedBox(height: 20),
                            Form(
                              key: myKey,
                              child: Column(
                                children: [
                                  MyTextfieled(
                                    nameField: "Email",
                                    textcontroller: controller.email,
                                    keyboardType: emailType,
                                    prefixIcon: prefixIconemail,
                                    valid: (val) {
                                      return validInput(val!, 5, 100, 'email');
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  GetBuilder<LoginControlarImp>(
                                    builder: (controller) => MyTextfieled(
                                      obscurate: controller.isShowPassword,
                                      onPressedIcons: () {
                                        controller.showPassword();
                                      },

                                      nameField: "Password",
                                      textcontroller: controller.password,
                                      keyboardType: passwordType,
                                      prefixIcon: prefixIconPassword,
                                      valid: (val) {
                                        return validInput(
                                          val!,
                                          5,
                                          30,
                                          'password',
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: CusttomTextAuth(
                                      tra: "3",
                                      onTap: () {
                                        Get.toNamed(AppRoots.forgetpassword);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Colors.red,
                                    ),
                                    child: MyCusttomButtun(
                                      onPressed: () {
                                        if (myKey.currentState!.validate()) {
                                          controller.login();
                                        }
                                      },
                                      nameButton: "Sign in",
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CusttomTextAuth(
                                    tra: "4",
                                    onTap: () {
                                      controller.goToSignUp();
                                    },
                                  ),

                                  SizedBox(height: 30),
                                  Text("6".tr),
                                  SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 10,
                                    children: [
                                      SigWithSoal(
                                        image: ImageAsset.logWithGoogle,
                                      ),
                                      SigWithSoal(
                                        image: ImageAsset.logWithFacebook,
                                      ),
                                      SigWithSoal(
                                        image: ImageAsset.logWithTwitter,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
