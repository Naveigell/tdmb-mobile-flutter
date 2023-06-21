import 'package:get/get.dart';

import '../controllers/materi1_controller.dart';

class Materi1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Materi1Controller>(
      () => Materi1Controller(),
    );
  }
}
