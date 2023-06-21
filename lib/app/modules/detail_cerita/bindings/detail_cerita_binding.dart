import 'package:get/get.dart';

import '../controllers/detail_cerita_controller.dart';

class DetailCeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCeritaController>(
      () => DetailCeritaController(),
    );
  }
}
