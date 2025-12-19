import 'package:delivary_ecomers/contoller/auth/loginController.dart';
import 'package:delivary_ecomers/core/class/handlingDataView.dart';
import 'package:delivary_ecomers/core/constant/appRoots.dart';
import 'package:delivary_ecomers/core/constant/colorApp.dart';
import 'package:delivary_ecomers/core/constant/imageAssete.dart';
import 'package:delivary_ecomers/core/function/validate.dart';
import 'package:delivary_ecomers/view/widgit/auth/custtomButtonAuth.dart';
import 'package:delivary_ecomers/view/widgit/auth/custtomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            color: ColorApp.colorLog,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 40),
                  height: 200,
                  width: 200,

                  child: Image.asset(ImageAsset.photoLogin),
                ),
                Form(
                  key: key,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CusttomTextFormField(
                          validator: (value) {
                            return validInput(value!, 3, 20, "email");
                          },
                          textController: controller.email!,
                          name: 'email',
                          prefixIcon: Icons.email,
                        ),
                        SizedBox(height: 20),
                        CusttomTextFormField(
                          validator: (value) {
                            return validInput(value!, 8, 20, "password");
                          },
                          textController: controller.password!,
                          name: 'password',
                          prefixIcon: Icons.password,
                          onPressedIcon: () {
                            controller.visiblePassword();
                          },
                          obscureText: controller.isShowPassword,
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.checkEmail();
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              "3".tr,
                              style: TextStyle(
                                color: ColorApp.pblack,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 110,
                          child: CusttomButtonAuth(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                controller.goToHome();
                              }
                            },
                            name: "37".tr,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("6".tr, style: TextStyle(color: ColorApp.pblack)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ClipOval(
                      child: Image.asset(ImageAsset.logWithGoogle, width: 35),
                    ),

                    Image.asset(ImageAsset.logWithFacebook, width: 35),
                    Image.asset(ImageAsset.logWithTwitter, width: 35),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
