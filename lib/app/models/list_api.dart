class ListApi {
  int? pageno;
  List<dynamic> data = [];

  ListApi({this.pageno, required this.data});

  ListApi.fromJson(Map<String, dynamic> json) {
    pageno = json['pageno'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pageno'] = pageno;
    data['data'] = data;
    return data;
  }
}
