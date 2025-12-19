import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getDataa(String usersId) async {
    var response = await crud.postData(APpLink.viewFavorite, {
      "userId": usersId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteDataa(String favoriteId) async {
    var response = await crud.postData(APpLink.deleteFromFavorite, {
      "favoriteId":favoriteId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
