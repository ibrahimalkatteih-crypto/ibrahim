// ignore_for_file: file_names

class FavoriteModel {
  final int favoriteId;
  final int favoriteUsersId;
  final int favoriteItemsId;

  // تفاصيل المنتج المرتبط بالمفضلة
  final int itemsId;
  final String itemsName;
  final String itemsNameAr;
  final String itemsDesc;
  final String itemsDescAr;
  final String itemsImage;
  final int itemsCount;
  final int itemsActive;
  final double itemsPrice;
  final double itemsDescount;
  final DateTime itemsDatetime;
  final int itemsCa;

  // المستخدم صاحب المفضلة
  final int usersId;

  FavoriteModel({
    required this.favoriteId,
    required this.favoriteUsersId,
    required this.favoriteItemsId,
    required this.itemsId,
    required this.itemsName,
    required this.itemsNameAr,
    required this.itemsDesc,
    required this.itemsDescAr,
    required this.itemsImage,
    required this.itemsCount,
    required this.itemsActive,
    required this.itemsPrice,
    required this.itemsDescount,
    required this.itemsDatetime,
    required this.itemsCa,
    required this.usersId,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      favoriteId: json['favorite_id'],
      favoriteUsersId: json['favorite_users_id'],
      favoriteItemsId: json['favorite_items_id'],
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDesc: json['items_desc'],
      itemsDescAr: json['items_desc_ar'],
      itemsImage: json['items_image'],
      itemsCount: json['items_count'],
      itemsActive: json['items_active'],
      itemsPrice: (json['items_price'] as num).toDouble(),
      itemsDescount: (json['items_descount'] as num).toDouble(),
      itemsDatetime: DateTime.parse(json['items_datetime']),
      itemsCa: json['items_ca'],
      usersId: json['users_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favorite_id': favoriteId,
      'favorite_users_id': favoriteUsersId,
      'favorite_items_id': favoriteItemsId,
      'items_id': itemsId,
      'items_name': itemsName,
      'items_name_ar': itemsNameAr,
      'items_desc': itemsDesc,
      'items_desc_ar': itemsDescAr,
      'items_image': itemsImage,
      'items_count': itemsCount,
      'items_active': itemsActive,
      'items_price': itemsPrice,
      'items_descount': itemsDescount,
      'items_datetime': itemsDatetime.toIso8601String(),
      'items_ca': itemsCa,
      'users_id': usersId,
    };
  }
}
