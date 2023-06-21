import 'dart:convert';

import 'package:tdmb2/app/utils/utils.dart';
import 'package:get/get.dart';

import '../splash_model.dart';

class SplashProvider extends GetConnect {
  Future<Splash> get_app() async {
    final response = await get('$url' + 'get-app');
    return Splash.fromJson(jsonDecode(response.body));
  }
}
