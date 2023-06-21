class ResPage {
  bool? status;
  String? message;
  List<dynamic> data = [];
  int? pageno;
  dynamic master;

  ResPage(
      {this.status,
      this.message,
      required this.data,
      this.pageno,
      this.master});

  ResPage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    pageno = json['pageno'];
    master = json['master'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = data;
    data['pageno'] = pageno;
    data['master'] = master;
    return data;
  }
}
