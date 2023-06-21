import 'dart:convert';

import 'package:tdmb2/app/utils/utils.dart';
import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  Future<dynamic> jadwalHariIni(String nik, String token) async {
    final form = FormData({'nik': nik});
    final response = await post('$url' + 'cek-jadwal-hari-ini', form,
        headers: {'authorization': '$token'});
    return response;
  }

  Future<dynamic> slider(String token) async {
    final form = FormData({});
    final response = await post('$url' + 'slider', form,
        headers: {'authorization': '$token'});
    return response;
  }
}
