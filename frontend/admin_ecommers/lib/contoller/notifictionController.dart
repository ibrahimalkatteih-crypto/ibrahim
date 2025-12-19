
import 'package:admin_ecommers/core/class/statusRequest.dart';
import 'package:admin_ecommers/core/function/handlingData.dart';
import 'package:admin_ecommers/core/service/myservices.dart';
import 'package:admin_ecommers/data/datasourse/remote/notifictionData.dart';
import 'package:get/get.dart';

class NotifycationController extends GetxController {
  NotifycationData notifycationData = NotifycationData(Get.find());

  List data =[

  ];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await notifycationData.getDataa(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
