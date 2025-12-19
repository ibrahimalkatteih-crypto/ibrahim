import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);
  getDataa(String usersId) async {
    var response = await crud.postData(APpLink.archiveorder, {
      "users_id":usersId
    });
    return response.fold((l) => l, (r) => r);
  }

  ratingData(String orderId,String orderRating,String orderNote) async {
    var response = await crud.postData(APpLink.rating, {
      "orders_id":orderId,
      "orders_rating":orderRating,
      "orders_rating_note":orderNote,
    });
    return response.fold((l) => l, (r) => r);
  }
  
}
