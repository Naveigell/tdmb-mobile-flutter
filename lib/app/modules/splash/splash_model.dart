class Splash {
  String? appId;
  String? appVersion;

  Splash({this.appId, this.appVersion});

  Splash.fromJson(Map<String, dynamic> json) {
    appId = json['app_id'];
    appVersion = json['app_version'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['app_id'] = appId;
    data['app_version'] = appVersion;
    return data;
  }
}
