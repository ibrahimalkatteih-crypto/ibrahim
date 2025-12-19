import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/mycartController.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/view/widget/cart/buttomCart.dart';
import 'package:flutter_application_3/view/widget/cart/custtomButtonCoupon.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CusttomButtomNavigtionbarCart extends GetView<MyCartControllerImp> {
  final TextEditingController controllerCoupon;
  final void Function() onPressedCoupon;
  final String price;
  final String discount;
  final String totalPrice;
  final String shaping;
   const CusttomButtomNavigtionbarCart({
    super.key,
    required this.price,
    required this.discount,
    required this.totalPrice,
    required this.controllerCoupon,
    required this.onPressedCoupon,
    required this.shaping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          GetBuilder<MyCartControllerImp>(
            builder: (controller) => controller.couponName == null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: controllerCoupon,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(2),
                                        hintText: "Coupon Code",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Expanded(
                                    flex: 1,
                                    child: ButtomCoupon(
                                      textButton: "apply",
                                      onPressed: onPressedCoupon,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: Text(
                      "coupon : ${controller.couponName!}",
                      style: TextStyle(
                        color: const Color.fromARGB(244, 181, 35, 35),
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorApp.seconryColor, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("price", style: TextStyle(fontSize: 17)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(price, style: TextStyle(fontSize: 17)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("discount", style: TextStyle(fontSize: 17)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(discount, style: TextStyle(fontSize: 17)),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("shaping", style: TextStyle(fontSize: 17)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(shaping, style: TextStyle(fontSize: 17)),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(color: Colors.black54),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        "totalPrice",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: const Color.fromARGB(244, 145, 30, 30),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        totalPrice,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: const Color.fromARGB(244, 145, 30, 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ButtomCart(textButton: "order", onPressed: () {
            controller.goToPageCheckout();
            // Get.toNamed(AppRoots.checkOut);
          }),
        ],
      ),
    );
  }
}
