import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/addressData.dart';
import 'package:flutter_application_3/data/datasourse/remote/checkoutData.dart';
import 'package:flutter_application_3/data/model/addressModel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));

  CheckoutData checkoutData = CheckoutData(Get.find());

  String? paymentMethod;
  String? deliveryType;
  String addressId="0";

  StatusRequest statusRequest = StatusRequest.none;

  List<AddressModel> data = [];

  MyServices myServices = Get.find();

  late String couponId, priceOrder,couponDiscount,priceOrderNow;



  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShapingAddress(String val) {
    addressId = val;
    update();
  }

  getShapinAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData.getDataa(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List databody = response['data'];
        data.addAll(databody.map((e) => AddressModel.fromJson(e)));
        // if(data.isEmpty){}
        addressId=data[0].addressId.toString();
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("error", "plese select payment_method");
    }
    if (deliveryType == null) {
      return Get.snackbar("error", "plese select delivery_type");
    }

    statusRequest = StatusRequest.loading;
    update();

    Map variable = {
      "users_id": myServices.sharedPreferences.getString('id')!,
      "address_id": addressId.toString(),
      "order_type": deliveryType.toString(),
      "price_delivery": '10',
      "order_price": priceOrder.toString(),
      "coupon_id": couponId.toString(),
      "coupon_discount":couponDiscount.toString(),
      "payment_method": paymentMethod.toString(),
    };
    var response = await checkoutData.checkoutData(variable);

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoots.home);
        Get.snackbar("note...", "scuccessfuly");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("note...", "plese try again");
      }
    }
    update();
  }

  @override
  void onInit() {
    getShapinAddress();
    couponId = Get.arguments['coupon_id'];
    priceOrder = Get.arguments['price_order'];
    couponDiscount=Get.arguments['coupon_discount'];
    priceOrderNow=Get.arguments['price_order'];
    super.onInit();
  }
}
