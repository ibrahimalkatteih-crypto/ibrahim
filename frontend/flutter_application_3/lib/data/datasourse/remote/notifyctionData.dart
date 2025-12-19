import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class NotifycationData {
  Crud crud;
  NotifycationData(this.crud);
  getDataa(String usersId) async {
    var response = await crud.postData(APpLink.notifyction, {

      "users_id":usersId
    });
    return response.fold((l) => l, (r) => r);
  }
}
