

import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';

class CheckEmailData{
  Crud crud;
  CheckEmailData(this.crud);
  getDataa(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email":email
    });
    return response.fold((l) => l, (r) => r);
  }

}