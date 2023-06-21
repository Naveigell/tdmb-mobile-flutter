import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/routes/app_pages.dart';

final user = GetStorage();

void clearSession() {
  user.remove("user_id");
  user.remove("user_name");
  user.remove("user_gender");
  user.remove("user_phone");
  user.remove("user_photo");
  user.remove("user_school");
  user.remove("user_address");
  Get.offAllNamed(Routes.LOGIN);
}
