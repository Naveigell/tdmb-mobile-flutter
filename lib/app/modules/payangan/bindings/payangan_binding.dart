import 'package:get/get.dart';

import '../controllers/payangan_controller.dart';

class PayanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayanganController>(
      () => PayanganController(),
    );
  }
}
