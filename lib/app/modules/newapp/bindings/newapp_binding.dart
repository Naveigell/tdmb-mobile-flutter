import 'package:get/get.dart';

import '../controllers/newapp_controller.dart';

class NewappBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewappController>(
      () => NewappController(),
    );
  }
}
