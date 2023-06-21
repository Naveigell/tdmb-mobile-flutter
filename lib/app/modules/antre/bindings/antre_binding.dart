import 'package:get/get.dart';

import '../controllers/antre_controller.dart';

class AntreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AntreController>(
      () => AntreController(),
    );
  }
}
