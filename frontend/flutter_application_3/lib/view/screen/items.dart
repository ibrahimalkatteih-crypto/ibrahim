import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/favoritecontroller.dart';
import 'package:flutter_application_3/controlar/itemscontroller.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/data/model/itemsmodel.dart';
import 'package:flutter_application_3/view/screen/home.dart';

import 'package:flutter_application_3/view/widget/custtomAppBar.dart';
import 'package:flutter_application_3/view/widget/items/custtomListemItems.dart';
import 'package:flutter_application_3/view/widget/items/listCategreisItems.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) => ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Custtomappbar(
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
            ),
            SizedBox(height: 5),
            ListCategoreisItems(),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: 
              !controller.isSerch?
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.69,
                ),
                itemCount: controller.items.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  controllerFav.isFavorite[controller
                          .items[index]['items_id']] =
                      controller.items[index]['favorite'];
                  return CusttomIistemItems(
                    itemsModel: ItemsModel.fromJson(controller.items[index]),
                    //active: true,
                  );
                },
              ):ListItemsSerch(listDataModel: controller.listData),
            ),
          ],
        ),
      ),
    );
  }
}






// GetBuilder(
//       builder: (controller) => Scaffold(
//         body: ListView(
//           children: [
//             Container(
//               padding: EdgeInsets.all(15),
//               child: Custtomappbar(
//                 onPressedIcon: () {},
//                 onPressedsearch: () {},
//                 titleAppBar: "34".tr,
//               ),
//             ),
//             SizedBox(height: 5),

//             ListCategoreisItems(),
//           ],
//         ),
//       ),
//     );