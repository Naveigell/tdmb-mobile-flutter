import 'package:get/get.dart';
import 'package:tdmb2/app/utils/utils.dart';

class DetailJadwalProvider extends GetConnect {
  Future<dynamic> detailJadwal(
      String jadwal_id, int pageno, String token) async {
    final form = FormData({'jadwal_id': jadwal_id, 'pageno': pageno});
    final response = await post('$url' + 'detail-jadwal', form,
        headers: {'authorization': '$token'});
    return response;
  }

  Future<dynamic> prosesAntre(String antri_poli_id, String jadwal_id,
      String tanggal, String status, String token) async {
    final form = FormData({
      'jadwal_id': jadwal_id,
      'antri_poli_id': antri_poli_id,
      'tanggal': tanggal,
      'status': status
    });
    final response = await post('$url' + 'proses-antre', form,
        headers: {'authorization': '$token'});
    return response;
  }

  Future<dynamic> selesaiJadwal(String jadwal_id, String token) async {
    final form = FormData({'jadwal_id': jadwal_id});
    final response = await post('$url' + 'selesai-jadwal', form,
        headers: {'authorization': '$token'});
    return response;
  }
}
