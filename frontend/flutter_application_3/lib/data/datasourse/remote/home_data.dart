import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getDataa() async {
    var response = await crud.postData(APpLink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  serchDataa(String serch) async {
    var response = await crud.postData(APpLink.serch, {"serch": serch});
    return response.fold((l) => l, (r) => r);
  }
}
