import 'package:get/get.dart';

import '../controllers/antre_pasien_controller.dart';

class AntrePasienBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AntrePasienController>(
      () => AntrePasienController(),
    );
  }
}
