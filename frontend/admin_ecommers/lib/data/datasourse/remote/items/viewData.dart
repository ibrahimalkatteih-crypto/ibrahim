

import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';

class ViewDataItems{
  Crud crud;
  ViewDataItems(this.crud);
  getDataa() async {
    var response = await crud.postData(AppLink.viewItems, {
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id,String nameImage) async {
    var response = await crud.postData(AppLink.deletItems, {
      "id":id,
      "image_name":nameImage
    });
    return response.fold((l) => l, (r) => r);
  }

}