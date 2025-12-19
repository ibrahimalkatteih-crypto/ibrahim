import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/auth/virfiycode.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerFiyCode extends StatelessWidget {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();
  VerFiyCode({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(FvirFiyCodeControllarImp());
    return Scaffold(
      body:GetBuilder<FvirFiyCodeControllarImp>(builder: (controllar)=> 
      HandlingDataRequest(statusRequest: controllar.statusRequest,widget:       
      Container(
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
                      controllar.goToResetPassword(verificationCode);
                      
                    }, // end onSubmit
                  ),
                  SizedBox(height: 20),
                  // Container(
                  //   width: 150,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(20)),
                  //     color: Colors.red,
                  //   ),
                  //   child: MyCusttomButtun(
                  //     onPressed: () {
                  //       if (myKey.currentState!.validate()) {
                  //         // controlar.goToSignIn();
                  //       }
                  //     },
                  //     nameButton: '10'.tr,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),))
    );
  }
}
