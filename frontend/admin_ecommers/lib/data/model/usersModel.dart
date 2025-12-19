class UsersModel {
  int? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  String? usersVirfiycode;
  int? usersApprove;
  String? usersDatetime;
  String? usersPassword;

  UsersModel(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPhone,
      this.usersVirfiycode,
      this.usersApprove,
      this.usersDatetime,
      this.usersPassword});

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVirfiycode = json['users_virfiycode'];
    usersApprove = json['users_approve'];
    usersDatetime = json['users_datetime'];
    usersPassword = json['users_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_virfiycode'] = this.usersVirfiycode;
    data['users_approve'] = this.usersApprove;
    data['users_datetime'] = this.usersDatetime;
    data['users_password'] = this.usersPassword;
    return data;
  }
}