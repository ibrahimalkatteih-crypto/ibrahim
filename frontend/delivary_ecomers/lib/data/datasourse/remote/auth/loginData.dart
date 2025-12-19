import 'package:delivary_ecomers/core/class/crud.dart';
import 'package:delivary_ecomers/linkapi.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);
  getDataa(String email,String password) async {
    var response = await crud.postData(AppLink.login, {
      "email":email,
      "password":password
    });
    return response.fold((l) => l, (r) => r);
  }

}