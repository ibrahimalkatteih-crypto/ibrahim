import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:flutter_application_3/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getDataa(String usersId) async {
    var response = await crud.postData(APpLink.viewAddress, {
      "users_id": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }

  addDataa(
    String usersId,
    String addressName,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(APpLink.addAdress, {
      'users_id': usersId,
      "address_name": addressName,
      "city": city,
      "street": street,
      "lat": lat,
      "lang": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  editDataa(
    String addressId,
    String addressName,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(APpLink.editAddress, {
      "address_id": addressId,
      "address_name": addressName,
      "city": city,
      "street": street,
      "lat": lat,
      "lang": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteDataa(String addressId) async {
    var response = await crud.postData(APpLink.removeAddress, {
      "address_id": addressId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
