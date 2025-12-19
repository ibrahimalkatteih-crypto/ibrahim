import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkoutData(Map data) async {
    var response = await crud.postData(APpLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
