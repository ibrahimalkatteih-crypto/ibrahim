import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/favoritecontroller.dart';
import 'package:flutter_application_3/controlar/offersController.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/constant/iamgeasset.dart';
import 'package:flutter_application_3/core/myfunctions/translatedDatabase.dart';
import 'package:flutter_application_3/data/model/itemsmodel.dart';
import 'package:flutter_application_3/linkapi.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CusttomItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;
  //final bool active;
  const CusttomItemsOffers({
    super.key,
    required this.itemsModel,
    //required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProdactDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl: "${APpLink.imageItems}/${itemsModel.itemsImage}",
                      fit: BoxFit.fill,
                      height: 170,
                    ),
                  ),
                  Text(
                    translatedDatabase(
                      itemsModel.itemsName,
                      itemsModel.itemsNameAr,
                    ),
                    style: TextStyle(
                      color: ColorApp.pblack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("reting 3.5"),
                  //     Container(
                  //       height: 22,
                  //       alignment: Alignment.center,
                  //       child: Row(
                  //         children: [
                  //           ...List.generate(
                  //             5,
                  //             (index) => Icon(Icons.star, size: 15),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemsPriceDescount}\$",
                        style: TextStyle(
                          color: ColorApp.seconryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            
                      GetBuilder<FavoriteControllerImp>(
                        builder: (controllerFav) => IconButton(
                          onPressed: () {
                            if (controllerFav.isFavorite[itemsModel.itemsId] == 1) {
                              controllerFav.setFavorite(itemsModel.itemsId, 0);
                              controllerFav.removeFavorite(
                                itemsModel.itemsId.toString(),
                              );
                            } else {
                              controllerFav.setFavorite(itemsModel.itemsId, 1);
                              controllerFav.addFavorite(
                                itemsModel.itemsId.toString(),
                              );
                            }
                          },
                          icon: Icon(
                            // ignore: unrelated_type_equality_checks
                            controllerFav.isFavorite[itemsModel.itemsId] == 1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: ColorApp.seconryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if(itemsModel.itemsDescount!=0)
            Image.asset(ImageAsset.discount,width: 40,),
          ],
        ),
      ),
    );
  }
}
