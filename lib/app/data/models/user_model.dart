class User {
  String? user_id;
  String? user_name;
  String? user_username;
  String? user_phone;
  String? user_gender;
  String? user_photo;
  String? user_address;
  String? user_school;

  User({
    this.user_id,
    this.user_name,
    this.user_username,
    this.user_phone,
    this.user_gender,
    this.user_photo,
    this.user_address,
    this.user_school,
  });

  User.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    user_name = json['user_name'];
    user_username = json['user_username'];
    user_phone = json['user_phone'];
    user_gender = json['user_gender'];
    user_photo = json['user_photo'];
    user_address = json['user_address'];
    user_school = json['user_school'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = user_id;
    data['user_name'] = user_name;
    data['user_username'] = user_username;
    data['user_phone'] = user_phone;
    data['user_gender'] = user_gender;
    data['user_photo'] = user_photo;
    data['user_address'] = user_address;
    data['user_school'] = user_school;

    return data;
  }
}
