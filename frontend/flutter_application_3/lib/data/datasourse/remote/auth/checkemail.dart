import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class CheckEmailPass {
  Crud crud;
  CheckEmailPass(this.crud);
  postDataa(String email) async {
    var response = await crud.postData(APpLink.checkEmail, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
