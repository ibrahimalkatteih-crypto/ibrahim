import 'package:delivary_ecomers/core/class/crud.dart';
import 'package:delivary_ecomers/linkapi.dart';


class AcceptedData {
  Crud crud;
  AcceptedData(this.crud);
  getDataa(String deliveryId) async {
    var response = await crud.postData(AppLink.orderaccepted, {
      "delivery_id":deliveryId
    });
    return response.fold((l) => l, (r) => r);
  }

  doneOrder(String orderId,String usersId) async {
    var response = await crud.postData(AppLink.doneOrder, {
      "order_id":orderId,
      "users_id":usersId
    });
    return response.fold((l) => l, (r) => r);
  }
 
}
