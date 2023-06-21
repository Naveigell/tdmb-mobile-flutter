import 'package:get/get.dart';

import '../controllers/puskesmas_controller.dart';

class PuskesmasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PuskesmasController>(
      () => PuskesmasController(),
    );
  }
}
