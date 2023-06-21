class ResponseApi {
  bool? status;
  String? message;

  ResponseApi({this.status, this.message});

  ResponseApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
