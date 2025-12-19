import 'package:delivary_ecomers/core/class/crud.dart';
import 'package:delivary_ecomers/linkapi.dart';


class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);
  getDataa(String deliveryId) async {
    var response = await crud.postData(AppLink.archiveorder, {
      "delivery_id":deliveryId
    });
    return response.fold((l) => l, (r) => r);
  }

  
  
}
