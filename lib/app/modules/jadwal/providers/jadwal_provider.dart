import 'package:get/get.dart';
import 'package:tdmb2/app/utils/utils.dart';

class JadwalProvider extends GetConnect {
  Future<dynamic> listJadwal(
      String nik, int pageno, String tanggal, String token) async {
    final form = FormData(
        {'nik': nik, 'jadwal_poli_tanggal': tanggal, 'pageno': pageno});
    final response = await post('$url' + 'list-jadwal', form,
        headers: {'authorization': '$token'});
    return response;
  }

  Future<dynamic> deleteJadwal(String jadwal_id, String token) async {
    final form = FormData({'jadwal_id': jadwal_id});
    final response = await post('$url' + 'delete-jadwal', form,
        headers: {'authorization': '$token'});
    return response;
  }
}
