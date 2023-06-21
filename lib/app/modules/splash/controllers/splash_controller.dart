import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tdmb2/app/modules/landing/bindings/landing_binding.dart';
import 'package:tdmb2/app/modules/landing/views/landing_view.dart';
import 'package:tdmb2/app/modules/login/bindings/login_binding.dart';
import 'package:tdmb2/app/modules/login/views/login_view.dart';
import 'package:tdmb2/app/modules/splash/providers/splash_provider.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';

// import 'package:native_shared_preferences/native_shared_preferences.dart';

class SplashController extends GetxController {
  // NativeSharedPreferences? preferences;

  final user = GetStorage();

  // String? getLocal(String key) {
  //   return this.preferences?.getString(key);
  // }

  // void deleteLocalItem(String key) {
  //   this.preferences?.remove(key);
  // }

  // Future<void> initializePreference() async {
  //   if (user.read("user_id") != null) {
  //     Timer(Duration(seconds: 3), () {
  //       Get.offAllNamed(Routes.LANDING);
  //     });
  //   } else {
  //     Timer(Duration(seconds: 3), () {
  //       Get.offAllNamed(Routes.LOGIN);
  //     });
  //   }
  // }

  Future<void> getApp() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return SplashProvider().get_app().then((response) {
      print(response.appVersion);
      print(packageInfo.version);
      // user.remove("first_launch");
      if (response.appVersion == packageInfo.version) {
        if (user.read("user_id") == null) {
          if (user.read("first_launch") != null) {
            Timer(Duration(seconds: 3), () {
              Get.offAllNamed(Routes.LOGIN);
            });
          } else {
            Timer(Duration(seconds: 3), () {
              Get.offAllNamed(Routes.WELCOME);
            });
          }
        } else {
          if (user.read("first_launch") != null) {
            Timer(Duration(seconds: 3), () {
              Get.offAllNamed(Routes.LANDING);
            });
          } else {
            Timer(Duration(seconds: 3), () {
              Get.offAllNamed(Routes.WELCOME);
            });
          }
        }
      } else {
        Get.offAllNamed(Routes.NEWAPP);
      }
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getApp();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
