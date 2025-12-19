class CartItems {
  final int itemsPrice;
  final int countItems;
  final int cartId;
  final int cartUsersId;
  final int cartItemsId;
  final int itemsId;
  final String itemsName;
  final String itemsNameAr;
  final String itemsDesc;
  final String itemsDescAr;
  final String itemsImage;
  final int itemsCount;
  final int itemsActive;
  final double itemsPriceSingle;
  final double itemsDiscount;
  final DateTime itemsDatetime;
  final int itemsCategory;
  final double priceNow;


  CartItems({
    required this.itemsPrice,
    required this.countItems,
    required this.cartId,
    required this.cartUsersId,
    required this.cartItemsId,
    required this.itemsId,
    required this.itemsName,
    required this.itemsNameAr,
    required this.itemsDesc,
    required this.itemsDescAr,
    required this.itemsImage,
    required this.itemsCount,
    required this.itemsActive,
    required this.itemsPriceSingle,
    required this.itemsDiscount,
    required this.itemsDatetime,
    required this.itemsCategory,
    required this.priceNow,
  });

  factory CartItems.fromJson(Map<String, dynamic> json) {
    return CartItems(
      itemsPrice: (json['itemsPrice'] as num).toInt(),
      countItems: (json['countItems'] as num).toInt(),
      cartId: (json['cart_id'] as num).toInt(),
      cartUsersId: (json['cart_users_id'] as num).toInt(),
      cartItemsId: (json['cart_items_id'] as num).toInt(),
      itemsId: (json['items_id'] as num).toInt(),
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDesc: json['items_desc'],
      itemsDescAr: json['items_desc_ar'],
      itemsImage: json['items_image'],
      itemsCount: (json['items_count'] as num).toInt(),
      itemsActive: (json['items_active'] as num).toInt(),
      itemsPriceSingle: (json['items_price'] as num).toDouble(),
      itemsDiscount: (json['items_descount'] as num).toDouble(),
      itemsDatetime: DateTime.parse(json['items_datetime'].trim()),
      itemsCategory: (json['items_ca'] as num).toInt(),
      priceNow: (json['cart_price_now'] as num?)?.toDouble()??0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemsPrice': itemsPrice,
      'countItems': countItems,
      'cart_id': cartId,
      'cart_users_id': cartUsersId,
      'cart_items_id': cartItemsId,
      'items_id': itemsId,
      'items_name': itemsName,
      'items_name_ar': itemsNameAr,
      'items_desc': itemsDesc,
      'items_desc_ar': itemsDescAr,
      'items_image': itemsImage,
      'items_count': itemsCount,
      'items_active': itemsActive,
      'items_price': itemsPriceSingle,
      'items_descount': itemsDiscount,
      'items_datetime': itemsDatetime.toIso8601String(),
      'items_ca': itemsCategory,
      'cart_price_now': priceNow,
    };
  }
}