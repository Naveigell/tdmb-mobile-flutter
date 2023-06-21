import 'package:get/get.dart';

import '../controllers/praktek_controller.dart';

class PraktekBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PraktekController>(
      () => PraktekController(),
    );
  }
}
