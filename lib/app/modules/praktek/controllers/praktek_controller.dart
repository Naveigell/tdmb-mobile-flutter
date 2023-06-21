import 'dart:async';
import 'dart:convert';

import 'package:alert/alert.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/models/response_api.dart';
import 'package:tdmb2/app/modules/praktek/providers/praktek_provider.dart';
import 'package:tdmb2/app/modules/register/providers/register_provider.dart';
import 'package:tdmb2/app/modules/register/register_model.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

class PraktekController extends GetxController {
  final user = GetStorage();
  RxString kode = ''.obs;
  RxString link = ''.obs;
  RxString catatan = ''.obs;
  RxBool isLoading = false.obs;

  Future<void> tambahSoal(String kd, String lnk, String cttn) {
    return PraktekProvider()
        .tambahSoal(kd, lnk, cttn, user.read("user_id"))
        .then((response) {
      isLoading.value = false;

      if (ResponseApi.fromJson(jsonDecode(response.body)).status == true) {
        Alert(
                message:
                    ResponseApi.fromJson(jsonDecode(response.body)).message!,
                shortDuration: true)
            .show();

        Timer(Duration(seconds: 2), () {
          Get.offAllNamed(Routes.LANDING);
        });
      } else {
        Alert(
                message:
                    ResponseApi.fromJson(jsonDecode(response.body)).message!,
                shortDuration: true)
            .show();
      }
    });
  }

  void setLoading(bool e) {
    isLoading.value = e;
  }

  void setKode(String name) {
    kode.value = name;
  }

  void setLink(String name) {
    link.value = name;
  }

  void setCatatan(String e) {
    catatan.value = e;
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
