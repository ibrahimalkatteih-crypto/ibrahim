import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/homecontrollar.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/data/model/itemsmodel.dart';
import 'package:flutter_application_3/linkapi.dart';
import 'package:flutter_application_3/view/widget/home/custteomtitlehome.dart';
import 'package:flutter_application_3/view/widget/custtomAppBar.dart';
import 'package:flutter_application_3/view/widget/home/custtomCardHome.dart';
import 'package:flutter_application_3/view/widget/home/listCategoreisHome.dart';
import 'package:flutter_application_3/view/widget/home/listItemsHoem.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(HomeControllarImp());

    return GetBuilder<HomeControllarImp>(
      builder: (controllar) => Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            Custtomappbar(
              titleAppBar: "34".tr,
              // onPressedIcon: () {},
              onPressedsearch: () {
                controllar.onSerch();
              },
              onPressedIconFav: () {
                Get.toNamed(AppRoots.myFavorite);
              },
              onChanged: (val) {
                controllar.checkSerch(val);
              },
              myController: controllar.serch!,
            ),

            HandlingDataView(
              statusRequest: controllar.statusRequest,
              widget: controllar.isSerch == false
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     if(controllar.textSetting.isNotEmpty)   Custtomcardhome(
                          title: controllar.textSetting[0]['textSetting_title'],
                          body: controllar.textSetting[0]['textSetting_body'],
                        ),
                        CusttomTitleHome(title: "36".tr),
                        ListCategoreisHome(),
                        CusttomTitleHome(title: "Top Selling"),
                        ListItemsHome(),

                        
                      ],
                    )
                  : ListItemsSerch(listDataModel: controllar.listData),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemsSerch extends GetView<HomeControllarImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSerch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDataModel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToProdactDetails(listDataModel[index]);
          },
          child: Container(
            margin: EdgeInsets.all(10),

            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${APpLink.imageItems}/${listDataModel[index].itemsImage}",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(listDataModel[index].itemsName),
                        subtitle: Text(listDataModel[index].categoriesName),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
