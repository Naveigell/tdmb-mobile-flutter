class HomeSlider {
  String? title;
  String? path;

  HomeSlider({this.title, this.path});

  HomeSlider.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['path'] = path;
    return data;
  }
}
