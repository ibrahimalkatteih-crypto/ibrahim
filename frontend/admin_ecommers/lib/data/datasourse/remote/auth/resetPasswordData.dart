import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';


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