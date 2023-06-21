import 'package:get/get.dart';

import '../controllers/list_praktek_controller.dart';

class ListPraktekBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPraktekController>(
      () => ListPraktekController(),
    );
  }
}
