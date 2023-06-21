import 'package:get/get.dart';

import '../controllers/mulai_controller.dart';

class MulaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MulaiController>(
      () => MulaiController(),
    );
  }
}
