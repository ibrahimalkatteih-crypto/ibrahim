import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/checkoutController.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/constant/iamgeasset.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/view/widget/checkOut/cardDeliveryType.dart';
import 'package:flutter_application_3/view/widget/checkOut/cardPaymentMethod.dart';
import 'package:flutter_application_3/view/widget/checkOut/cardShaipingAddress.dart';
import 'package:flutter_application_3/view/widget/checkOut/cardTitleType.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    
   CheckoutController controller= Get.put( CheckoutController());
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: MaterialButton(
          color: ColorApp.seconryColor,
          textColor: Colors.white,
          onPressed: () {
            controller.checkout();
          },
          child: Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                CardTitleType(title: "Choose Payment Method"),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod('0');
                  },
                  child: CardPaymentMethod(
                    title: 'Cash',
                    isActive: controller.paymentMethod == "0",
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod('1');
                  },
                  child: CardPaymentMethod(
                    title: 'Payment Card',
                    isActive: controller.paymentMethod == '1',
                  ),
                ),

                SizedBox(height: 20),
                CardTitleType(title: "Choose Delivery Type"),

                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("0");
                      },
                      child: CardDileveryType(
                        title: 'delivery',
                        imageName: ImageAsset.dilevery,
                        isActive: controller.deliveryType == "0",
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("1");
                      },
                      child: CardDileveryType(
                        title: 'driveThru',
                        imageName: ImageAsset.driveThru,
                        isActive: controller.deliveryType == "1",
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                if (controller.deliveryType == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardTitleType(title: "Shaping Address"),
                      controller.data.isEmpty?
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoots.addressAdd);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text(
                                "No Shipping Address Added \nClick Here To Add New Address",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ):
                      SizedBox(height: 10),

                      ...List.generate(controller.data.length, (index) {
                        return InkWell(
                          onTap: () {
                            controller.chooseShapingAddress(
                              controller.data[index].addressId.toString(),
                            );
                          },
                          child: CardShaipingAddress(
                            title: controller.data[index].addressName,
                            body:
                                '${controller.data[index].addressCity} ${controller.data[index].addressStreet}',
                            isActive:
                                controller.addressId ==
                                controller.data[index].addressId.toString(),
                          ),
                        );
                      }),
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
