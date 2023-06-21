import 'package:tdmb2/app/modules/register/ceknik_model.dart';

class Respon {
  bool? success;
  String? message;
  dynamic? data;

  Respon({this.success, this.message, this.data});

  Respon.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = DataCekNik.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final data2 = <String, dynamic>{};
    data2['success'] = success;
    data2['message'] = message;
    data2['data'] = data.toJson();
    return data2;
  }
}
