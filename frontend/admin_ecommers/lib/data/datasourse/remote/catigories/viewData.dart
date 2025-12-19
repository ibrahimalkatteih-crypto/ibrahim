

import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';

class ViewData{
  Crud crud;
  ViewData(this.crud);
  getDataa() async {
    var response = await crud.postData(AppLink.viewCatigories, {
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id,String nameImage) async {
    var response = await crud.postData(AppLink.deletCatigories, {
      "id":id,
      "image_name":nameImage
    });
    return response.fold((l) => l, (r) => r);
  }

}