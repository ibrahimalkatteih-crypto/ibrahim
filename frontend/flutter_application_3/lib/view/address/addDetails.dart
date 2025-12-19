import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/address/addPartTowController.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/core/shared/custtomButton.dart';
import 'package:flutter_application_3/view/widget/loginandsigin/textform.dart';
import 'package:get/get.dart';

class AddressAddPartTow extends StatelessWidget {
  const AddressAddPartTow({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(
      AddressAddPartTowController(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Add Details Address")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GetBuilder<AddressAddPartTowController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                MyTextfieled(
                  textcontroller: controller.city!,
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(Icons.location_city_outlined),
                  nameField: 'City',
                  valid: (val) {},
                ),
                MyTextfieled(
                  textcontroller: controller.street!,
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(Icons.streetview_outlined),
                  nameField: 'Street',
                  valid: (val) {},
                ),
                MyTextfieled(
                  textcontroller: controller.name!,
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(Icons.location_on_outlined),
                  nameField: 'name',
                  valid: (val) {
                     
                  },
                ),
                SizedBox(height: 20),
                CUsttomBottunShared(onPressed: () {
                  controller.AddAddress();
                }, nameButton: 'Add'),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   Get.toNamed(AppRoots.addressAdd);
      // },child: Icon(Icons.add),),
    );
  }
}



//'https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',