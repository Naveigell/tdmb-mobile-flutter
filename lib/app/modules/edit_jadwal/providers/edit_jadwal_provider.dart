import 'package:get/get.dart';
import 'package:tdmb2/app/utils/utils.dart';

class EditJadwalProvider extends GetConnect {
  Future<dynamic> editJadwal(
      String tglmulai,
      String jammulai,
      String jamselesai,
      String maxantrean,
      String jadwal_id,
      String token) async {
    final form = FormData({
      'tgl': tglmulai,
      'jammulai': jammulai,
      'jamselesai': jamselesai,
      'maxantrean': maxantrean,
      'jadwal_id': jadwal_id
    });
    final response = await post('$url' + 'edit-jadwal', form,
        headers: {'authorization': '$token'});
    return response;
  }
}
