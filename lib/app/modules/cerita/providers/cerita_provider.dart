import 'dart:convert';

import 'package:tdmb2/app/utils/utils.dart';
import 'package:get/get.dart';

class CeritaProvider extends GetConnect {
  Future<dynamic> listCerita(String judul, int pg) async {
    final form = FormData({'judul': judul, 'pageno': pg});
    final response = await post('$url' + 'get-all-cerita', form);
    return response;
  }
}
