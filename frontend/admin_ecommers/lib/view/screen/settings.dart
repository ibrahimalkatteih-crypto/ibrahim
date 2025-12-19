import 'package:admin_ecommers/contoller/settingsController.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/constant/imageAssete.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    bool flag = true;

    Get.put(SettingscontrollerIMp());
    return GetBuilder<SettingscontrollerIMp>(
      builder: (controller) => Container(
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: Get.width / 3,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(244, 174, 63, 63),
                  ),
                ),
                Positioned(
                  top: Get.width / 4.2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(ImageAsset.avatar),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Column(
                  children: [
                   
                    ListTile(
                      onTap: () {
                        // Get.toNamed(AppRoots.orderPinding);
                      },
                      trailing: Icon(Icons.receipt_long),
                      title: Text("orders"),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        // Get.toNamed(AppRoots.archive);
                      },
                      trailing: Icon(Icons.history),
                      title: Text("orders Archive"),
                    ),
                    Divider(),
                    // ListTile(
                    //   onTap: () {
                    //     Get.toNamed(AppRoots.addressView);
                    //   },
                    //   trailing: Icon(Icons.location_city_rounded),
                    //   title: Text("Address"),
                    // ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      trailing: Icon(Icons.help),
                      title: Text("about us"),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () async {
                        await launchUrl(Uri.parse("tel:+963981718315"));
                      },
                      trailing: Icon(Icons.phone),
                      title: Text("Contact us"),
                    ),
                    Divider(),

                    ListTile(
                      onTap: () {
                        controller.logOut();
                      },
                      trailing: Icon(Icons.exit_to_app),
                      title: Text("logout"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
