import 'dart:async';

import 'package:tdmb2/app/modules/login/providers/login_provider.dart';
import 'package:tdmb2/app/modules/login/respon_login_model.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  NativeSharedPreferences? preferences;
  final user = GetStorage();

  RxString username = ''.obs;
  RxString password = ''.obs;
  Rx<ResponLogin> data = ResponLogin().obs;
  RxBool isLoading = false.obs;
  RxBool passwordVisible = true.obs;

  Future<void> login(String usern, String password) async {
    // String? token = await FirebaseMessaging.instance.getToken();
    return LoginProvider().login(usern, password).then((response) {
      data.value = response;
      isLoading.value = false;

      print(response.message);

      if (response.success == false) {
        Get.snackbar("Login Gagal", response.message!,
            colorText: Colors.white, backgroundColor: Colors.red.shade800);
      } else {
        Get.snackbar("Login Berhasil", response.message!,
            colorText: Colors.white, backgroundColor: Colors.green.shade800);

        user.write("user_id", response.data.user_id);
        user.write("user_name", response.data.user_name);
        user.write("user_gender", response.data.user_gender);
        user.write("user_phone", response.data.user_phone);
        user.write("user_photo", response.data.user_photo);
        user.write("user_school", response.data.user_school);
        user.write("user_address", response.data.user_address);

        Timer(Duration(seconds: 1), () {
          Get.offAllNamed(Routes.LANDING);
        });
      }
    });
  }

  void setPasswordVisible() {
    if (passwordVisible.value == true) {
      passwordVisible.value = false;
    } else {
      passwordVisible.value = true;
    }
  }

  void setLoading(bool e) {
    isLoading.value = e;
  }

  void setUsername(String e) {
    username.value = e;
  }

  void setPassword(String e) {
    password.value = e;
  }

  String? getLocal(String key) {
    return this.preferences?.getString(key);
  }

  void setLocal(String key, String val) {
    this.preferences?.setString(key, val);
  }

  void deleteLocalItem(String key) {
    this.preferences?.remove(key);
  }

  Future<void> initializePreference() async {
    this.preferences = await NativeSharedPreferences.getInstance();
  }

  @override
  void onInit() {
    print("aaa");
    super.onInit();
    initializePreference();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
