class DeliveryModel {
  int? delivaryId;
  String? delivaryUsername;
  String? delivaryEmail;
  String? delivaryPhone;
  String? delivaryVerfiycode;
  int? delivaryApprove;
  String? delivaryDatetime;
  String? delivaryPassword;

  DeliveryModel(
      {this.delivaryId,
      this.delivaryUsername,
      this.delivaryEmail,
      this.delivaryPhone,
      this.delivaryVerfiycode,
      this.delivaryApprove,
      this.delivaryDatetime,
      this.delivaryPassword});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    delivaryId = json['delivary_id'];
    delivaryUsername = json['delivary_username'];
    delivaryEmail = json['delivary_email'];
    delivaryPhone = json['delivary_phone'];
    delivaryVerfiycode = json['delivary_verfiycode'];
    delivaryApprove = json['delivary_approve'];
    delivaryDatetime = json['delivary_datetime'];
    delivaryPassword = json['delivary_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivary_id'] = this.delivaryId;
    data['delivary_username'] = this.delivaryUsername;
    data['delivary_email'] = this.delivaryEmail;
    data['delivary_phone'] = this.delivaryPhone;
    data['delivary_verfiycode'] = this.delivaryVerfiycode;
    data['delivary_approve'] = this.delivaryApprove;
    data['delivary_datetime'] = this.delivaryDatetime;
    data['delivary_password'] = this.delivaryPassword;
    return data;
  }
}