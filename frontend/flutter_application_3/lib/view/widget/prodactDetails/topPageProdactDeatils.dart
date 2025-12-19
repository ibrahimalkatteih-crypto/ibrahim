import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/prodactControllerDetails.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/linkapi.dart';
import 'package:get/get.dart';

class TopPageProdactDetails extends GetView<ProdactDetailsControllerImp> {
  const TopPageProdactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: ColorApp.seconryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
        ),
        Positioned(
          top: 35,
          right: Get.width / 15,
          left: Get.width / 15,
          child: SizedBox(
            height: 270,

            child: Hero(
              tag: "${controller.itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${APpLink.imageItems}/${controller.itemsModel.itemsImage}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
