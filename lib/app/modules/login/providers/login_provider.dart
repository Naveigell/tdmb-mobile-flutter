import 'dart:convert';

import 'package:tdmb2/app/modules/login/respon_login_model.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:get/get.dart';

import '../login_model.dart';

class LoginProvider extends GetConnect {
  Future<ResponLogin> login(String usern, String password) async {
    final form = FormData({'username': usern, 'password': password});
    final response = await post('$url' + 'login', form);
    return ResponLogin.fromJson(jsonDecode(response.body));
  }
}
