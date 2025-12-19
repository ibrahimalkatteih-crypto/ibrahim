

import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';

class AllUsers{
  Crud crud;
  AllUsers(this.crud);
  getDataa() async {
    var response = await crud.postData(AppLink.allUsers, {
    });
    return response.fold((l) => l, (r) => r);
  }

}