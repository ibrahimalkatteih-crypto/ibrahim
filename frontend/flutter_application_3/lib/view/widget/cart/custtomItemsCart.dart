import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/constant/iamgeasset.dart';
import 'package:flutter_application_3/linkapi.dart';
import 'package:get/get.dart';

class CusttomItemsCart extends GetView {
  

  final void Function() onPressedAdd;
   final void Function() onPressedDelet;
   final String name;
   final String price;
   final int count;
   final String imageName;
  const CusttomItemsCart({super.key, required this.onPressedAdd, required this.onPressedDelet, required this.name, required this.price, required this.count, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(

              flex: 2,
              child: CachedNetworkImage(imageUrl:"${APpLink.imageItems}/$imageName", height: 90),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                  price,
                  style: TextStyle(
                    color: ColorApp.seconryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 30,
                    child: IconButton(onPressed: onPressedAdd, icon: Icon(Icons.add)),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 30,
                    child: Text(
                      "$count",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: IconButton(
                      onPressed:onPressedDelet,
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
