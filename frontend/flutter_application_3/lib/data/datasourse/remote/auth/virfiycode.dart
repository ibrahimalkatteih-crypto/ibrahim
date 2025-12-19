import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class VirfiyCodeForgetPass {
  Crud crud;
  VirfiyCodeForgetPass(this.crud);
  postDataa(String email, String virfiyCode) async {
    var response = await crud.postData(APpLink.virfiycodeforgetpass, {
      'email': email,
      'virfiycode': virfiyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
