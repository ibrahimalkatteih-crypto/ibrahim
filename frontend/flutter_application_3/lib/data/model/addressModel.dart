class AddressModel {
  final int addressId;
  final int addressUsersId;
  final String addressName;
  final String addressCity;
  final String addressStreet;
  final double addressLat;
  final double addressLang;

  AddressModel({
    required this.addressId,
    required this.addressUsersId,
    required this.addressName,
    required this.addressCity,
    required this.addressStreet,
    required this.addressLat,
    required this.addressLang,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressId: json['address_id'],
      addressUsersId: json['address_users_id'],
      addressName: json['address_name'],
      addressCity: json['address_city'],
      addressStreet: json['address_street'],
      addressLat: (json['address_lat'] as num).toDouble(),
      addressLang: (json['address_lang'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_id': addressId,
      'address_users_id': addressUsersId,
      'address_name': addressName,
      'address_city': addressCity,
      'address_street': addressStreet,
      'address_lat': addressLat,
      'address_lang': addressLang,
    };
  }
}