import 'package:get/get.dart';

import '../controllers/sanjiwani_controller.dart';

class SanjiwaniBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SanjiwaniController>(
      () => SanjiwaniController(),
    );
  }
}
