import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';


class AcceptedData {
  Crud crud;
  AcceptedData(this.crud);
  getDataa() async {
    var response = await crud.postData(AppLink.orderaccepted, {
    });
    return response.fold((l) => l, (r) => r);
  }

  prepper(String orderId,String usersId,String orderType) async {
    var response = await crud.postData(AppLink.prepperOrder, {
      "order_id":orderId,
      "users_id":usersId,
      "order_type":orderType
    });
    return response.fold((l) => l, (r) => r);
  }
 
}
