class ItemsModel {
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
  final double itemsPriceDescount;
  final DateTime itemsDatetime;
  final int itemsCa;

  final int categoriesId;
  final String categoriesName;
  final String categoriesNameAr;
  final String categoriesImage;
  final DateTime categoriesDatetime;

  final int favorite;

  ItemsModel({
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
    required this.itemsPriceDescount,
    required this.itemsDatetime,
    required this.itemsCa,
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesImage,
    required this.categoriesDatetime,
    required this.favorite,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      itemsId: (json['items_id'] as int?) ?? 0,
      itemsName: json['items_name'] ?? '',
      itemsNameAr: json['items_name_ar'] ?? '',
      itemsDesc: json['items_desc'] ?? '',
      itemsDescAr: json['items_desc_ar'] ?? '',
      itemsImage: json['items_image'] ?? '',
      itemsCount: (json['items_count'] as int?) ?? 0,
      itemsActive: (json['items_active'] as int?) ?? 0,
      itemsPrice: (json['items_price'] as num?)?.toDouble() ?? 0.0,
      itemsDescount: (json['items_descount'] as num?)?.toDouble() ?? 0.0,
      itemsPriceDescount: (json['itemsPriceDescount'] as num?)?.toDouble() ?? 0.0,
      itemsDatetime: DateTime.tryParse(json['items_datetime'] ?? '') ?? DateTime.now(),
      itemsCa: (json['items_ca'] as int?) ?? 0,
      categoriesId: (json['categories_id'] as int?) ?? 0,
      categoriesName: json['categories_name'] ?? '',
      categoriesNameAr: json['categories_name_ar'] ?? '',
      categoriesImage: json['categories_image'] ?? '',
      categoriesDatetime: DateTime.tryParse(json['categories_datatime'] ?? '') ?? DateTime.now(),
      favorite: (json['favorite'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      'itemsPriceDescount': itemsPriceDescount,
      'items_datetime': itemsDatetime.toIso8601String(),
      'items_ca': itemsCa,
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_name_ar': categoriesNameAr,
      'categories_image': categoriesImage,
      'categories_datatime': categoriesDatetime.toIso8601String(),
      'favorite': favorite,
    };
  }
}