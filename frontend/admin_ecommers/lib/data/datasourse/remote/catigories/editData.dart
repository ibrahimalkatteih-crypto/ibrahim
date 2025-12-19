import 'dart:io';

import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';

class Editdata {
  Crud crud;
  Editdata(this.crud);
  getDataa(Map data, [File? file]) async {
    if (file == null) {
      var response = await crud.postData(AppLink.editCatigories, data);
      return response.fold((l) => l, (r) => r);
    } else {
      var response = await crud.addRequestWithImageOne(
        AppLink.editCatigories,
        data,
        file,
      );
      return response.fold((l) => l, (r) => r);
    }
  }
}
