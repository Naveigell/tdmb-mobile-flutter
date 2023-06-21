import 'package:get/get.dart';

import '../controllers/pembahasan_controller.dart';

class PembahasanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembahasanController>(
      () => PembahasanController(),
    );
  }
}
