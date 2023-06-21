import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  RxInt currentPageValue = 0.obs;

  void changePage(int number) {
    print(number);
    currentPageValue.value = number;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
