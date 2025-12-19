import 'package:delivary_ecomers/core/class/crud.dart';
import 'package:delivary_ecomers/linkapi.dart';


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
