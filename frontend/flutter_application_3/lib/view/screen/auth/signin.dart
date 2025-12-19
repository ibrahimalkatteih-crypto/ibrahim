import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/auth/sign_up.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/core/myfunctions/alertexitapp.dart';
import 'package:flutter_application_3/core/myfunctions/validinput.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/custtmtext.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/custtomButton.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/imageAuth.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/textform.dart';
import 'package:get/get.dart';

class Sign_In extends StatelessWidget {
  final TextInputType userNameType = TextInputType.name;
  final TextInputType phoneType = TextInputType.phone;

  final TextInputType emailType = TextInputType.emailAddress;
  final TextInputType passwordType = TextInputType.visiblePassword;

  final Widget prefixIconemail = Icon(Icons.email);
  final Widget prefixIconname = Icon(Icons.person);
  final Widget prefixIconPhone = Icon(Icons.phone_android_outlined);

  final Widget prefixIconPassword = Icon(Icons.password);

  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  Sign_In({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignInControlarImp());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GetBuilder<SignInControlarImp>(
        builder: (controller) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              alertExitApp();
            },

            child: GetBuilder<SignInControlarImp>(builder: (controller)=>
            
HandlingDataRequest(   statusRequest: controller.statusRequest,widget:          
            Container(
              color: ColorApp.colorLog,
              child: SafeArea(
                child: Container(
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
                                Container(
                                  height: 55,
                                  child: MyTextfieled(
                                    nameField: "user name",
                                    textcontroller: controller.userName,
                                    keyboardType: userNameType,
                                    prefixIcon: prefixIconname,
                                    valid: (val) {
                                      return validInput(
                                        val!,
                                        5,
                                        100,
                                        'userName',
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),

                                Container(
                                  height: 55,
                                  child: MyTextfieled(
                                    nameField: "Email",
                                    textcontroller: controller.email,
                                    keyboardType: emailType,
                                    prefixIcon: prefixIconemail,
                                    valid: (val) {
                                      return validInput(val!, 5, 100, 'email');
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  height: 55,
                                  child: MyTextfieled(
                                    nameField: "Phone",
                                    textcontroller: controller.Phone,
                                    keyboardType: phoneType,
                                    prefixIcon: prefixIconPhone,
                                    valid: (val) {
                                      return validInput(val!, 10, 100, 'Phone');
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  height: 55,
                                  child: MyTextfieled(
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
                                        controller.sign_up();
                                      }
                                    },
                                    nameButton: "Sign Up",
                                  ),
                                ),
                                SizedBox(height: 20),
                                CusttomTextAuth(
                                  tra: "5",
                                  onTap: () {
                                    controller.goToSignIn();
                                  },
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )))
          );
        },
      ),
    );
  }
}
