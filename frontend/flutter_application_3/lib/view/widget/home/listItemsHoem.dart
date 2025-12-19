import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/homecontrollar.dart';
import 'package:flutter_application_3/data/model/itemsmodel.dart';
import 'package:flutter_application_3/linkapi.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllarImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),

        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Items(items: ItemsModel.fromJson(controller.items[index]));
        },
      ),
    );
  }
}


class Items extends GetView<HomeControllarImp> {

  final ItemsModel items;
  const Items({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       controller.goToProdactDetails(items);
      },
      child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.network(
                    "${APpLink.imageItems}/${items.itemsImage}",
                    fit: BoxFit.fill,
                    height: 100,
                    width: 150,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black38,
                  ),
                  height: 120,
                  width: 170,
                ),
      
                Positioned(
                  left: 10,
      
                  child: Text(
                    items.itemsName,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
    );
  }
}