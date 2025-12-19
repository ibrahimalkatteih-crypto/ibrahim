import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/itemscontroller.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/myfunctions/translatedDatabase.dart';
import 'package:flutter_application_3/data/model/categoriesmodel.dart';

import 'package:get/get.dart';

class ListCategoreisItems extends GetView<ItemsControllerImp> {
  const ListCategoreisItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      // color: Colors.black,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: controller.categoreis.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return Categoreis(
            categoreis: CatigorisModel.fromJson(controller.categoreis[index]),
            i: index,
          );
        },
      ),
    );
  }
}

class Categoreis extends GetView<ItemsControllerImp> {
  final CatigorisModel categoreis;
  final int? i;
  const Categoreis({super.key, required this.categoreis, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        //     controller.gotoItems(controller.categories, i!);
        controller.changeItems(i!,categoreis.categoriesId.toString());
      },
      child: 
      
      
      
      Column(
        children: [
          // paddingAll(10),  
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            // padding: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: controller.selectedCat == i
                      ? ColorApp.seconryColor
                      : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
            child: Text(
              translatedDatabase(categoreis.categoriesName, categoreis.categoriesNameAr)

              ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
