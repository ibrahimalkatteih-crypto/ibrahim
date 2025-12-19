import 'package:delivary_ecomers/core/class/crud.dart';
import 'package:delivary_ecomers/linkapi.dart';

class CheckEmailData{
  Crud crud;
  CheckEmailData(this.crud);
  getDataa(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email":email
    });
    return response.fold((l) => l, (r) => r);
  }

}