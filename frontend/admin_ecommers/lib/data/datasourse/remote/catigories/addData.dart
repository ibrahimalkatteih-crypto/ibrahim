

import 'dart:io';

import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';

class AddData{
  Crud crud;
  AddData(this.crud);
  getDataa(Map data,File file) async {
    var response = await crud.addRequestWithImageOne(AppLink.addCatigories,data,file);
    return response.fold((l) => l, (r) => r);
  }

}