import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getDataa(String id, String usersId) async {
    var response = await crud.postData(APpLink.items, {
      "id": id.toString(),
      "usersid": usersId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
