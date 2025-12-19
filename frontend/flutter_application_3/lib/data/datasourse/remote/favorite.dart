import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String userId, String itemsId) async {
    var response = await crud.postData(APpLink.addFavorite, {
      "usersid": userId,
      "itemsId": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
  removeFavorite(String userId, String itemsId) async {
    var response = await crud.postData(APpLink.removeFavorite, {
      "usersid": userId,
      "itemsId": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
