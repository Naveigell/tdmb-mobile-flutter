class Home {
  String? dokumen;
  String? mohon;
  String? unduh;
  List<dynamic> slider = [];
  List<dynamic> populer = [];

  Home(
      {this.dokumen,
      this.mohon,
      this.unduh,
      required this.slider,
      required this.populer});

  Home.fromJson(Map<String, dynamic> json) {
    slider = json['slider'];
    dokumen = json['dokumen'];
    mohon = json['mohon'];
    unduh = json['unduh'];
    populer = json['populer'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['slider'] = slider;
    data['dokumen'] = dokumen;
    data['mohon'] = mohon;
    data['unduh'] = unduh;
    data['populer'] = populer;
    return data;
  }
}
