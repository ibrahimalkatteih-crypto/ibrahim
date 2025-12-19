import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class PindingData {
  Crud crud;
  PindingData(this.crud);
  getDataa(String usersId) async {
    var response = await crud.postData(APpLink.pindingorder, {
      "users_id":usersId
    });
    return response.fold((l) => l, (r) => r);
  }
  DeleteDataa(String ordersId) async {
    var response = await crud.postData(APpLink.orderDelete, {
      "orders_id":ordersId
    });
    return response.fold((l) => l, (r) => r);
  }
}
