class OrderPendingModel {
  final int orderId;
  final int orderUsersId;
  final int orderAddress;
  final int orderType;
  final double orderPriceDelivery;
  final double orderPrice;
  final double orderTotalPrice;
  final int orderCoupon;
  final int orderPaymentMethod;
  final int orderStatus;
  final DateTime orderDatetime;

  // الحقول الجديدة
  final int orderRating;
  final String orderNoteRating;

  // معلومات العنوان
  final int addressId;
  final int addressUsersId;
  final String addressName;
  final String addressCity;
  final String addressStreet;
  final double addressLat;
  final double addressLang;
  final double orderPriceNow;

  OrderPendingModel({
    required this.orderId,
    required this.orderUsersId,
    required this.orderAddress,
    required this.orderType,
    required this.orderPriceDelivery,
    required this.orderPrice,
    required this.orderTotalPrice,
    required this.orderCoupon,
    required this.orderPaymentMethod,
    required this.orderStatus,
    required this.orderDatetime,
    required this.orderRating,
    required this.orderNoteRating,
    required this.addressId,
    required this.addressUsersId,
    required this.addressName,
    required this.addressCity,
    required this.addressStreet,
    required this.addressLat,
    required this.addressLang,
    required this.orderPriceNow,
  });

  factory OrderPendingModel.fromJson(Map<String, dynamic> json) {
    return OrderPendingModel(
      orderId: (json['order_id'] ?? 0) as int,
      orderUsersId: (json['order_users_id'] ?? 0) as int,
      orderAddress: (json['order_address'] ?? 0) as int,
      orderType: (json['order_type'] ?? 0) as int,
      orderPriceDelivery: (json['order_price_delivery'] as num?)?.toDouble() ?? 0.0,
      orderPrice: (json['order_price'] as num?)?.toDouble() ?? 0.0,
      orderTotalPrice: (json['order_total_price'] as num?)?.toDouble() ?? 0.0,
      orderCoupon: (json['order_coupon'] ?? 0) as int,
      orderPaymentMethod: (json['order_paymentMethod'] ?? 0) as int,
      orderStatus: (json['order_status'] ?? 0) as int,
      orderDatetime: DateTime.tryParse(json['order_datatime'] ?? '') ?? DateTime.now(),
      orderRating: (json['order_reting'] ?? 0) as int,
      orderNoteRating: json['order_note_reting'] ?? '',

      addressId: (json['address_id'] ?? 0) as int,
      addressUsersId: (json['address_users_id'] ?? 0) as int,
      addressName: json['address_name'] ?? '',
      addressCity: json['address_city'] ?? '',
      addressStreet: json['address_street'] ?? '',
      addressLat: (json['address_lat'] as num?)?.toDouble() ?? 0.0,
      addressLang: (json['address_lang'] as num?)?.toDouble() ?? 0.0,
      orderPriceNow: (json['order_price_now'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'order_users_id': orderUsersId,
      'order_address': orderAddress,
      'order_type': orderType,
      'order_price_delivery': orderPriceDelivery,
      'order_price': orderPrice,
      'order_total_price': orderTotalPrice,
      'order_coupon': orderCoupon,
      'orderPaymentMethod': orderPaymentMethod,
      'order_status': orderStatus,
      'order_datatime': orderDatetime.toIso8601String(),
      'order_reting': orderRating,
      'order_note_reting': orderNoteRating,
      'address_id': addressId,
      'address_users_id': addressUsersId,
      'address_name': addressName,
      'address_city': addressCity,
      'address_street': addressStreet,
      'address_lat': addressLat,
      'address_lang': addressLang,
      'order_price_now': orderPriceNow,
    };
  }
}