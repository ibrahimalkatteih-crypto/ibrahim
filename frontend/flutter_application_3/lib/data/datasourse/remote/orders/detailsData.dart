import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);
  getDataa(String orderId) async {
    var response = await crud.postData(APpLink.orderDetails, {
      "order_id":orderId
    });
    return response.fold((l) => l, (r) => r);
  }
}
