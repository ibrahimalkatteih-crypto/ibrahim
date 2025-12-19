import 'package:delivary_ecomers/core/class/crud.dart';
import 'package:delivary_ecomers/linkapi.dart';

class PindingData {
  Crud crud;
  PindingData(this.crud);
  getDataa() async {
    var response = await crud.postData(AppLink.pindingorder, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String deliveryId, String usersId, String orderId) async {
    var response = await crud.postData(AppLink.approveOrder, {
      "order_id": orderId,
      "users_id": usersId,
      "delivery_id": deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
