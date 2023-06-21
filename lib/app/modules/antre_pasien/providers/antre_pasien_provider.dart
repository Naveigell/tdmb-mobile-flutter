import 'package:get/get.dart';
import 'package:tdmb2/app/utils/utils.dart';

class AntrePasienProvider extends GetConnect {
  Future<dynamic> listAntrePasien(
      String nik, int pageno, String tanggal, String token) async {
    final form = FormData({'nik': nik, 'tanggal': tanggal, 'pageno': pageno});
    final response = await post('$url' + 'list-antre-pasien', form,
        headers: {'authorization': '$token'});
    return response;
  }

  Future<dynamic> batalAntre(String antri_poli_id, String token) async {
    final form = FormData({'antri_poli_id': antri_poli_id});
    final response = await post('$url' + 'batal-antre', form,
        headers: {'authorization': '$token'});
    return response;
  }
}
