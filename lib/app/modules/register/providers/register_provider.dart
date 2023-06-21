import 'dart:convert';

import 'package:tdmb2/app/modules/register/respon_model.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:get/get.dart';

import '../register_model.dart';

class RegisterProvider extends GetConnect {
  Future<Register> register(String nama, String alamat, String nohp,
      String sekolah, int gender, String username, String pass) async {
    final form = FormData({
      'nama': nama,
      'alamat': alamat,
      'telp': nohp,
      'sekolah': sekolah,
      'gender': gender,
      'username': username,
      'password': pass
    });
    final response = await post('$url' + 'register', form);
    return Register.fromJson(jsonDecode(response.body));
  }
}
