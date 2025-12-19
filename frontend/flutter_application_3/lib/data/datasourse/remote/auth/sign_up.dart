import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postDataa(
    String username,
    String email,
    String password,
    String phone,
  ) async {
    var response = await crud.postData(APpLink.signUp, {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
