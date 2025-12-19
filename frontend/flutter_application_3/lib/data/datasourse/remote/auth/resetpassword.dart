import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class ResetPass {
  Crud crud;
  ResetPass(this.crud);
  postDataa(String email,String password) async {
    var response = await crud.postData(APpLink.resetpassword, {
      'email': email,
      'password':password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
