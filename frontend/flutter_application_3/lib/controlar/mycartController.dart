import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/handlingdata.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/data/datasourse/remote/mycart.dart';
import 'package:flutter_application_3/data/model/cartItemsModel.dart';
import 'package:flutter_application_3/data/model/couponModel.dart';
import 'package:get/get.dart';

abstract class MyCartController extends GetxController {
  add(String itemsId);
  delet(String itemsId);
  getCountItems(String itemsId);
  view();
}

class MyCartControllerImp extends MyCartController {
  MyCartData myCartData = MyCartData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  TextEditingController? controllerCoupon;

  MyServices myServices = Get.find();
  List<CartItems> data = [];
  //هدا عم نستعملو لصفحة البرودكات ديتلس
  int countItems = 0;
  double priceOredr = 0;
  double priceOredrNow = 0;

  //هدا لصفحة لكارت
  int countOrder = 0;
  int discountCoupon = 0;
  String? couponName;
  String? couponId;

  CouponModel? couponModel;

  resetVarCart() {
    countOrder = 0;
    priceOredr = 0;
    data = [];
    update();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  goToPageCheckout() {
    if (data.isEmpty) {
      Get.snackbar("note...", "cart is empty");
    } else {
      Get.toNamed(
        AppRoots.checkOut,
        arguments: {
          "coupon_id": couponId ?? "0",
          "price_order": priceOredr.toString(),
          "coupon_discount": discountCoupon.toString(),
        },
      );
    }
  }

  @override
  add(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myCartData.getDataa(
      myServices.sharedPreferences.getString('id')!,
      itemsId,
    );
    print("$response+ =========================================");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "title", messageText: Text("add to cart"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  delet(String itemsId) async {
    statusRequest = StatusRequest.loading;

    var response = await myCartData.deleteDataa(
      myServices.sharedPreferences.getString('id')!,
      itemsId,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // List responseData = response['data'];

        //هون كان فينا نستعمل الطريقة الصحيحة ونضيفن مباشرة بس هيك مشان يتنظم الكود أفضل
        // data.addAll(responseData.map((e) => FavoriteModel.fromJson(e)));

        // data.removeWhere((e)=>e.favoriteId.toString()==favId);

        Get.rawSnackbar(title: "title", message: "تمت ازالة المنتج من السلة");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getCountItems(String itemsId) async {
    statusRequest = StatusRequest.loading;

    var response = await myCartData.getCountDataa(
      myServices.sharedPreferences.getString('id')!,
      itemsId,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        countItems = int.parse(response['data'].toString());

        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  view() async {
    statusRequest = StatusRequest.loading;

    var response = await myCartData.viewDataa(
      myServices.sharedPreferences.getString('id')!,
    );
    //print("$response+ =========================================");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        if (response['data_cart']['status'] == 'success') {
          List responseData = response['data_cart']['data'];
          Map responseDataCount = response['countPrice'];
          data = [];
          data.addAll(responseData.map((e) => CartItems.fromJson(e)));
          countOrder = int.parse(responseDataCount['totalCount'].toString());
          priceOredr = double.parse(responseDataCount['totalPrice'].toString());
          // priceOredrNow = double.parse(responseDataCount['cart_price_now'].toString());
          //        Get.rawSnackbar(title: "title", messageText: Text("add to cart"));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getTotalPrice() {
    return priceOredr - priceOredr * discountCoupon / 100;
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;

    var response = await myCartData.checkCoupon(controllerCoupon!.text);

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Map<String, dynamic> dataCoupon = response['data'];

        couponModel = CouponModel.fromJson(dataCoupon);
        discountCoupon = couponModel!.couponDiscount;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId.toString();
      } else {
        discountCoupon = 0;
        couponName = null;
        couponId = null;
        Get.snackbar("note...", "coupon is not valid");
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    view();

    super.onInit();
  }
}
