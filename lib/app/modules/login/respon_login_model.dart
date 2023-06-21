import 'package:tdmb2/app/data/models/user_model.dart';

class ResponLogin {
  bool? success;
  String? message;
  dynamic data;

  ResponLogin({this.success, this.message, this.data});

  ResponLogin.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = User.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final data2 = <String, dynamic>{};
    data2['success'] = success;
    data2['message'] = message;
    data2['data'] = data.toJson();
    return data2;
  }
}
