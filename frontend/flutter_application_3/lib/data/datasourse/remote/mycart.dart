import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class MyCartData {
  Crud crud;
  MyCartData(this.crud);
  getDataa(String userId,String itemsId) async {
    var response = await crud.postData(APpLink.addCart, {
      "users_id": userId.toString(),
      "items_id": itemsId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteDataa(String userId, String itemsId) async {
    var response = await crud.postData(APpLink.removeCart, {
      "users_id": userId.toString(),
      "items_id": itemsId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  
  getCountDataa(String userId, String itemsId) async {
    var response = await crud.postData(APpLink.countItemsCart, {
      "users_id": userId.toString(),
      "items_id": itemsId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  viewDataa(String userId) async {
    var response = await crud.postData(APpLink.viewCart, {
      "users_id": userId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName)async{
    var response = await crud.postData(APpLink.checkCoupon, {
      "coupon_name": couponName.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

}
