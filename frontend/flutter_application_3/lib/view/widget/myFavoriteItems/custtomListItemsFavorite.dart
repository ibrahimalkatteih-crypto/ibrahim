import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/myFavorite.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/myfunctions/translatedDatabase.dart';
import 'package:flutter_application_3/data/model/favoriteModel.dart';
import 'package:flutter_application_3/linkapi.dart';
import 'package:get/get.dart';

class CusttomListFavoriteItems extends GetView<MyFavoriteControllerImp> {
  final FavoriteModel favoriteModel;
  //final bool active;
  const CusttomListFavoriteItems({
    super.key,
    required this.favoriteModel,
    //required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: InkWell(
        onTap: () {
          // controller.goToProdactDetails(favoriteModel );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Hero(
                  tag: "${favoriteModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl: "${APpLink.imageItems}/${favoriteModel.itemsImage}",
                    fit: BoxFit.fill,
                    height: 150,
                  ),
                ),
                Text(
                  translatedDatabase(
                    favoriteModel.itemsName,
                    favoriteModel.itemsNameAr,
                  ),
                  style: TextStyle(
                    color: ColorApp.pblack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("reting 3.5"),
                    Container(
                      height: 22,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Icon(Icons.star, size: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${favoriteModel.itemsPrice}\$",
                      style: TextStyle(
                        color: ColorApp.seconryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.deleteFromFavorite(favoriteModel.favoriteId.toString());
                      },
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        color: ColorApp.seconryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
