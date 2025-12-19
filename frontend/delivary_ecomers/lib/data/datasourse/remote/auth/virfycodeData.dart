import 'package:delivary_ecomers/core/class/crud.dart';
import 'package:delivary_ecomers/linkapi.dart';

class VirfyCodeData{
  Crud crud;
  VirfyCodeData(this.crud);
  virfyCodeData(String email,String virfyCode) async {
    var response = await crud.postData(AppLink.virfyCode, {
      "email":email,
      "verifiycode":virfyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  reSendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
  
}