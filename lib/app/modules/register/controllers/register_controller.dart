import 'dart:async';

import 'package:tdmb2/app/modules/register/providers/register_provider.dart';
import 'package:tdmb2/app/modules/register/register_model.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

class RegisterController extends GetxController {
  RxString nama = ''.obs;
  RxInt gender = 1.obs;

  RxString alamat = ''.obs;
  RxString hp = ''.obs;
  RxString username = ''.obs;
  RxString pass = ''.obs;
  RxString pass2 = ''.obs;
  RxString sekolah = ''.obs;

  Rx<Register> data = Register().obs;
  RxBool isLoading = false.obs;
  RxBool passwordVisible = true.obs;
  RxBool passwordVisible2 = true.obs;

  void setGender(int val) {
    gender.value = val;
  }

  Future<void> register(String nama, String alamat, String nohp, String sekolah,
      int kelamin, String username, String pass) {
    return RegisterProvider()
        .register(nama, alamat, nohp, sekolah, kelamin, username, pass)
        .then((response) {
      data.value = response;
      isLoading.value = false;

      if (response.status == false) {
        Get.snackbar("Pendaftaran Gagal", response.message!,
            colorText: Colors.white, backgroundColor: Colors.red.shade800);
      } else {
        Get.snackbar("Pendaftaran Berhasil", response.message!,
            colorText: Colors.white, backgroundColor: Colors.green.shade800);
        Timer(Duration(seconds: 3), () {
          Get.toNamed(Routes.LOGIN);
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

  void setPasswordVisible2() {
    if (passwordVisible2.value == true) {
      passwordVisible2.value = false;
    } else {
      passwordVisible2.value = true;
    }
  }

  void setLoading(bool e) {
    isLoading.value = e;
  }

  void setNama(String name) {
    nama.value = name;
  }

  void setSekolah(String name) {
    sekolah.value = name;
  }

  void setUsername(String e) {
    username.value = e;
  }

  void setAlamat(String e) {
    alamat.value = e;
  }

  void setHp(String e) {
    hp.value = e;
  }

  void setPassword(String e) {
    pass.value = e;
  }

  void setPassword2(String e) {
    pass2.value = e;
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
