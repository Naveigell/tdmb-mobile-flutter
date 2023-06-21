import 'package:get/get.dart';
import 'package:tdmb2/app/utils/utils.dart';

class ProfileProvider extends GetConnect {
  Future<dynamic> profil(String id) async {
    final form = FormData({'user_id': id});
    final response = await post('$url' + 'get-profile', form);
    return response;
  }

  Future<dynamic> changePassword(String id, String pass) async {
    final form = FormData({'user_id': id, 'pass': pass});
    final response = await post('$url' + 'change-password', form);
    return response;
  }

  Future<dynamic> changeProfile(String id, String name, String phone,
      String address, String school) async {
    final form = FormData({
      'user_id': id,
      'user_name': name,
      'user_phone': phone,
      'user_address': phone,
      'user_school': phone
    });
    final response = await post('$url' + 'change-profile', form);
    return response;
  }
}
