import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/favoritecontroller.dart';
import 'package:flutter_application_3/controlar/offersController.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/view/screen/home.dart';
import 'package:flutter_application_3/view/widget/custtomAppBar.dart';

import 'package:flutter_application_3/view/widget/offers/custtomItemsOffers.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
        FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GetBuilder<OffersController>(
        builder: (controller) => ListView(children: [
          Custtomappbar(
              titleAppBar: "34".tr,
              // onPressedIcon: () {},
              onPressedsearch: () {
                controller.onSerch();
              },
              onPressedIconFav: () {
                Get.toNamed(AppRoots.myFavorite);
              },
              onChanged: (val) {
                controller.checkSerch(val);
              },
              myController: controller.serch!,
            ),
            SizedBox(height: 20,),
          HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: 
          
          !controller.isSerch?
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return CusttomItemsOffers(
                itemsModel: controller.data[index],
                //active: true,
              );
            },
          ):ListItemsSerch(listDataModel: controller.listData),
        ),
        ],)
      ),
    );
  }
}
