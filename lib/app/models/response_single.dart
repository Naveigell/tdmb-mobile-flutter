class ResSingle {
  bool? status;
  String? message;
  dynamic data;

  ResSingle({this.status, this.message, this.data});

  ResSingle.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
