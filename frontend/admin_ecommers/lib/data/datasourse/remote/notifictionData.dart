

import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';

class NotifycationData {
  Crud crud;
  NotifycationData(this.crud);
  getDataa(String usersId) async {
    var response = await crud.postData(AppLink.notifyction, {

      "users_id":usersId
    });
    return response.fold((l) => l, (r) => r);
  }
}
