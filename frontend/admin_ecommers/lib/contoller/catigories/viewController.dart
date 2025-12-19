import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/data/datasourse/remote/catigories/viewData.dart';
import 'package:admin_ecommers/data/model/catigoriesModel.dart';
import 'package:get/get.dart';

class ViewCatigoriesController extends GetxController {
  ViewData viewData = ViewData(Get.find());

  List<CatigorisModel> data = [];

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
        data.addAll(responseBody.map((e) => CatigorisModel.fromJson(e)));
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
        Get.snackbar("success", "48".tr);
        data.removeWhere((e) => e.categoriesId.toString() == id);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToEdit(CatigorisModel catigorisModel) {
    Get.toNamed(
      AppRoots.editCatigories,
      arguments: {"catigorisModel": catigorisModel},
    );
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
