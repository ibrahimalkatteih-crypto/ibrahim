import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/homecontrollar.dart';
import 'package:flutter_application_3/core/constant/color.dart';
import 'package:flutter_application_3/core/myfunctions/translatedDatabase.dart';
import 'package:flutter_application_3/data/model/categoriesmodel.dart';
import 'package:flutter_application_3/linkapi.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoreisHome extends GetView<HomeControllarImp> {
  const ListCategoreisHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      // color: Colors.black,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return Categoreis(
            categoreis: CatigorisModel.fromJson(controller.categories[index]),
            i: index,
          );
        },
      ),
    );
  }
}

class Categoreis extends GetView<HomeControllarImp> {
  final CatigorisModel categoreis;
  final int? i;
  const Categoreis({super.key, required this.categoreis, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoItems(
          controller.categories,
          i!,
          '${categoreis.categoriesId}',
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(244, 224, 169, 169),
              borderRadius: BorderRadius.circular(40),
            ),
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            width: 80,
            child: SvgPicture.network(
              "${APpLink.imageCategories}/${categoreis.categoriesImage}",
              colorFilter: ColorFilter.mode(
                ColorApp.seconryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          // SizedBox(height: 5),
          Text(
            translatedDatabase(
              categoreis.categoriesName,
              categoreis.categoriesNameAr,
            ),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
