import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';


class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);
  getDataa(String orderId) async {
    var response = await crud.postData(AppLink.orderDetails, {
      "order_id":orderId
    });
    return response.fold((l) => l, (r) => r);
  }
}
