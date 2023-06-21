import 'package:get/get.dart';

import '../controllers/objektif_controller.dart';

class ObjektifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ObjektifController>(
      () => ObjektifController(),
    );
  }
}
