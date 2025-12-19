import 'package:admin_ecommers/core/class/crud.dart';
import 'package:admin_ecommers/linkapi.dart';


class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);
  getDataa() async {
    var response = await crud.postData(AppLink.archiveorder, {
    });
    return response.fold((l) => l, (r) => r);
  }

  
  
}
