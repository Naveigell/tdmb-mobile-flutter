class Login {
  bool? status;
  String? message;
  String? user_id;
  String? user_nama;
  String? user_email;
  String? user_telp;
  String? user_activated;
  String? user_nik;
  String? user_alamat;
  String? user_fcm;

  Login(
      {this.status,
      this.message,
      this.user_id,
      this.user_nama,
      this.user_email,
      this.user_telp,
      this.user_activated,
      this.user_nik,
      this.user_alamat,
      this.user_fcm});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user_id = json['user_id'];
    user_nama = json['user_nama'];
    user_email = json['user_email'];
    user_telp = json['user_telp'];
    user_activated = json['user_activated'];
    user_nik = json['user_nik'];
    user_alamat = json['user_alamat'];
    user_fcm = json['user_fcm'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['user_id'] = user_id;
    data['user_nama'] = user_nama;
    data['user_email'] = user_email;
    data['user_telp'] = user_telp;
    data['user_activated'] = user_activated;
    data['user_nik'] = user_nik;
    data['user_alamat'] = user_alamat;
    data['user_fcm'] = user_fcm;
    return data;
  }
}
