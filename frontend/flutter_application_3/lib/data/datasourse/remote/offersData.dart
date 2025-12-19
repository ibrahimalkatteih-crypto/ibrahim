import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);
  getDataa() async {
    var response = await crud.postData(APpLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
