import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getDataa() async {
    var response = await crud.postData(APpLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
