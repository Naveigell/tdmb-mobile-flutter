import 'package:get/get.dart';

class LandingController extends GetxController {
  var tabIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
