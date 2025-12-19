import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/prodactControllerDetails.dart';
import 'package:get/get.dart';

class PriceAndAmount extends GetView<ProdactDetailsControllerImp> {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final double price;
  final int count;
  const PriceAndAmount({
    required this.price,
    required this.count,
    required this.onRemove,
    required this.onAdd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: const Color.fromARGB(244, 227, 35, 35),
              ),

              child: IconButton(
                onPressed: onAdd,
                icon: Icon(Icons.add, size: 30),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "$count",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color.fromARGB(244, 227, 35, 35),
              ),
              child: IconButton(
                onPressed: onRemove,
                icon: Icon(Icons.remove, size: 30),
              ),
            ),
          ],
        ),
        Spacer(),

        Text(
          "$price",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
