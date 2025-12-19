import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class VirfiyCode {
  Crud crud;
  VirfiyCode(this.crud);
  postDataa(String email, String virfiyCode) async {
    var response = await crud.postData(APpLink.virfiycode, {
      'email': email,
      'virfiycode': virfiyCode,
    });
    return response.fold((l) => l, (r) => r);
  }


  reSendData(String email)async{
    var response = await crud.postData(APpLink.reSend, {
      'email': email,
    //  'virfiycode': virfiyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
