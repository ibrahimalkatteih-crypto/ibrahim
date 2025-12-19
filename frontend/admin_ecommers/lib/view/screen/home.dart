import 'package:admin_ecommers/contoller/homeController.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/constant/imageAssete.dart';
import 'package:admin_ecommers/view/widgit/home/cardAdmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

     Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(title: Text("Order")),
      body: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 150,
        ),
        children: [
          
          CardAdmin(image: ImageAsset.catigories, onTap: () {
            Get.toNamed(AppRoots.viewCatigories);
          }, title: "catigories"),

          CardAdmin(image: ImageAsset.prodact, onTap: () {
            Get.toNamed(AppRoots.viewItems);
          }, title: "Items"),
          CardAdmin(image: ImageAsset.users, onTap: () {
            Get.toNamed(AppRoots.allUsers);
          }, title: "users"),
          CardAdmin(image: ImageAsset.order, onTap: () {
            Get.toNamed(AppRoots.orderScreen);
          }, title: "Orders"),
          CardAdmin(
            image: ImageAsset.notifction,
            onTap: () {
              Get.toNamed(AppRoots.notifction);
            },
            title: "Notifcation",
          ),
        ],
      ),
    );
  }
}
