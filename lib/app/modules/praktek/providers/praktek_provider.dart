import 'dart:convert';

import 'package:tdmb2/app/utils/utils.dart';
import 'package:get/get.dart';

// import '../register_model.dart';
//
class PraktekProvider extends GetConnect {
  Future<dynamic> tambahSoal(
      String kode, String link, String catatan, String id) async {
    final form = FormData({
      'praktek_kode': kode,
      'praktek_user_id': id,
      'praktek_link': link,
      'praktek_catatan': catatan
    });
    final response = await post('$url' + 'tambah-soal-praktek', form);
    return response;
  }
}
