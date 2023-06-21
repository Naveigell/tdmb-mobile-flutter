import 'dart:convert';

import 'package:tdmb2/app/utils/utils.dart';
import 'package:get/get.dart';

class ListPraktekProvider extends GetConnect {
  Future<dynamic> listCerita(String judul, int pg) async {
    final form = FormData({'kode': judul, 'pageno': pg});
    final response = await post('$url' + 'get-all-praktek', form);
    return response;
  }
}
