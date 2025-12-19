import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/myFavorite.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/view/screen/home.dart';
import 'package:flutter_application_3/view/widget/custtomAppBar.dart';
import 'package:flutter_application_3/view/widget/myFavoriteItems/custtomListItemsFavorite.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: GetBuilder<MyFavoriteControllerImp>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(horizontal: 10),

          child: ListView(
            children: [
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
              SizedBox(height: 10,),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: 
                
                !controller.isSerch?
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65
                  ),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CusttomListFavoriteItems(
                      favoriteModel: controller.data[index],
                    );
                  },
                ):ListItemsSerch(listDataModel: controller.listData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
