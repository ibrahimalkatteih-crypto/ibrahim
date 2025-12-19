import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/mycartController.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/view/widget/cart/custtomButtomNavigtionBarCart.dart';
import 'package:flutter_application_3/view/widget/cart/custtomItemsCart.dart';
import 'package:flutter_application_3/view/widget/cart/topCardCart.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyCartControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        
      ),
      bottomNavigationBar: GetBuilder<MyCartControllerImp>(
        builder: (controllercart) => CusttomButtomNavigtionbarCart(
          
          controllerCoupon: controllercart.controllerCoupon!,
          onPressedCoupon: () {
              controllercart.checkCoupon();
          },
          price: "${controllercart.priceOredr}",
          discount: "${controllercart.discountCoupon}",
          totalPrice: "${controllercart.getTotalPrice()}", shaping: '10',
        ),
      ),
      body: GetBuilder<MyCartControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              
              TopCardCart(
                message: "you yave ${controller.countOrder} item in cart",
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                      controller.data.length,
                      (index) => CusttomItemsCart(
                        imageName: controller.data[index].itemsImage,
                        onPressedAdd: () async {
                          await controller.add(
                            controller.data[index].itemsId.toString(),
                          );
                          controller.refreshPage();
                        },
                        onPressedDelet: () async {
                          await controller.delet(
                            controller.data[index].itemsId.toString(),
                          );
                          controller.refreshPage();
                        },
                        name: controller.data[index].itemsName,
                        price: '${controller.data[index].itemsPrice}',
                        count: controller.data[index].countItems,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
