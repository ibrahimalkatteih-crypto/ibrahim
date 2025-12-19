import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';

class PindingData {
  Crud crud;
  PindingData(this.crud);
  getDataa() async {
    var response = await crud.postData(AppLink.pindingorder, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData( String usersId, String orderId) async {
    var response = await crud.postData(AppLink.approveOrder, {
      "order_id": orderId,
      "users_id": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
