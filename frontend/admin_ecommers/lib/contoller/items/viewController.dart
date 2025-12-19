import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/data/datasourse/remote/items/viewData.dart';
import 'package:admin_ecommers/data/model/catigoriesModel.dart';
import 'package:admin_ecommers/data/model/itemsModel.dart';
import 'package:get/get.dart';

class ViewItemsController extends GetxController {
  ViewDataItems viewData = ViewDataItems(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data = [];
    statusRequest = StatusRequest.loading;
    update();

    var response = await viewData.getDataa();

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseBody = response['data'];
        data.addAll(responseBody.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String id, String nameImage) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await viewData.deleteData(id, nameImage);

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar("success", "62".tr);
        data.removeWhere((e) => e.itemsId.toString() == id);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToEdit(ItemsModel itemsModel) {
    Get.toNamed(AppRoots.editItems, arguments: {"itemsModel": itemsModel});
  }

  goToAddPage() {
    Get.toNamed(AppRoots.addItems, arguments: {"dataItems": data});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myBack() {
    Get.offAllNamed(AppRoots.home);
  }
}
