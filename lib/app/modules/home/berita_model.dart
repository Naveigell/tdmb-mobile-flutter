class Berita {
  List<dynamic> data = [];

  Berita({required this.data});

  Berita.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = data;
    return data;
  }
}
