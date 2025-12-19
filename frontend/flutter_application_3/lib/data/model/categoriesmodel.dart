class CatigorisModel {
  final int categoriesId;
  final String categoriesName;
  final String categoriesNameAr;
  final String categoriesImage;
  final DateTime categoriesDatetime;

  CatigorisModel({
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesImage,
    required this.categoriesDatetime,
  });

  factory CatigorisModel.fromJson(Map<String, dynamic> json) {
    return CatigorisModel(
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
      categoriesNameAr: json['categories_name_ar'],
      categoriesImage: json['categories_image'],
      categoriesDatetime: DateTime.parse(json['categories_datatime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_name_ar': categoriesNameAr,
      'categories_image': categoriesImage,
      'categories_datatime': categoriesDatetime.toIso8601String(),
    };
  }
}