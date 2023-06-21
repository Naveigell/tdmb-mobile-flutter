import 'package:get/get.dart';
import 'package:tdmb2/app/utils/utils.dart';

class SanjiwaniProvider extends GetConnect {
  Future<dynamic> listJadwalAntre(String faskes_kode, int pageno,
      String tanggal, String poli_nama, String token) async {
    final form = FormData({
      'faskes_kode': faskes_kode,
      'tanggal': tanggal,
      'poli_nama': poli_nama,
      'pageno': pageno
    });
    final response = await post('$url' + 'list-jadwal-antre', form,
        headers: {'authorization': '$token'});
    return response;
  }

  Future<dynamic> ambilAntre(String jadwal_id, String nik, String token) async {
    final form = FormData({'jadwal_id': jadwal_id, 'nik': nik});
    final response = await post('$url' + 'ambil-antre', form,
        headers: {'authorization': '$token'});
    return response;
  }
}
