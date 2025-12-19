// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/prodactControllerDetails.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';

import 'package:flutter_application_3/view/widget/prodactDetails/price_amount.dart';
import 'package:flutter_application_3/view/widget/prodactDetails/subItemsList.dart';
import 'package:flutter_application_3/view/widget/prodactDetails/topPageProdactDeatils.dart';
import 'package:get/get.dart';

class ProdactDetails extends StatelessWidget {
  const ProdactDetails({super.key});

  @override
  Widget build(BuildContext context) {
   ProdactDetailsControllerImp controller=Get.put(ProdactDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorApp.seconryColor,
          borderRadius: BorderRadius.circular(10),
        ),

        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 40,
        child: MaterialButton(
          onPressed: () {
            Get.toNamed(AppRoots.cart);
          },
          child: Text(
            "Go to Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProdactDetailsControllerImp>(
        builder: (controller) =>
        
        HandlingDataView(statusRequest: controller.statusRequest, widget: 

         ListView(
          children: [
            TopPageProdactDetails(),
            SizedBox(height: 70),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.itemsModel.itemsName,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: const Color.fromARGB(255, 27, 78, 165),
                    ),
                  ),
                  SizedBox(height: 10),
                  PriceAndAmount(
                    onRemove: () {
                      
                      controller.romove();
                    },
                    onAdd: () {
                      
                      controller.add();
                    },
                    price: controller.itemsModel.itemsPriceDescount,
                    count: controller.countItems,
                  ),
                  SizedBox(height: 10),
                  Text(
                    controller.itemsModel.itemsDesc +
                        controller.itemsModel.itemsDesc,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color.fromARGB(255, 47, 85, 151),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Colors",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: const Color.fromARGB(255, 47, 85, 151),
                    ),
                  ),
                  SizedBox(height: 10),
                  SubItemsList(),
                ],
              ),
            ),
          ],
        ),)
      ),
    );
  }
}
