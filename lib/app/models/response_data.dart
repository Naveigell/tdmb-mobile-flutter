class ResData {
  bool? status;
  String? message;
  List<dynamic> data = [];

  ResData({this.status, this.message, required this.data});

  ResData.fromJson(Map<String, dynamic> json) {
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
