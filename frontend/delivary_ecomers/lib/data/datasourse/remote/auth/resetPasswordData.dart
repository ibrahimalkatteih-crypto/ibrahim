import 'package:delivary_ecomers/core/class/crud.dart';
import 'package:delivary_ecomers/linkapi.dart';

class ResetPasswordData{
  Crud crud;
  ResetPasswordData(this.crud);
  resetPasswordData(String email,String password) async {
    var response = await crud.postData(AppLink.resetPassord, {
      "email":email,
      "password":password
    });
    return response.fold((l) => l, (r) => r);
  }
  
}