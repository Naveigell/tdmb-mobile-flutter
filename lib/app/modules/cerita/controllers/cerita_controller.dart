import 'dart:async';
import 'dart:convert';

import 'package:tdmb2/app/models/response_page.dart';
import 'package:tdmb2/app/modules/cerita/providers/cerita_provider.dart';
import 'package:tdmb2/app/modules/register/providers/register_provider.dart';
import 'package:tdmb2/app/modules/register/register_model.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

class CeritaController extends GetxController {
  RxString judul_cerita = ''.obs;
  RxInt pageno = 1.obs;

  Rx<ResPage> dataList = ResPage(data: []).obs;
  RxList<dynamic> cList = [].obs;
  RxBool load = false.obs;

  Rx<Register> data = Register().obs;
  RxBool isLoading = true.obs;

  Future<void> listCerita(int pgno, String judul) {
    return CeritaProvider().listCerita(judul, pgno).then((response) {
      dataList.value = ResPage.fromJson(jsonDecode(response.body));
      pageno.value = ResPage.fromJson(jsonDecode(response.body)).pageno!;
      cList = cList + dataList.value.data;

      if (ResPage.fromJson(jsonDecode(response.body)).data.length == 0) {
        load = RxBool(false);
      } else {
        load = RxBool(true);
      }
      isLoading.value = false;
    });
  }

  Future<void> listCeritaRefresh(int pgno, String judul) {
    return CeritaProvider().listCerita(judul, pgno).then((response) {
      dataList.value = ResPage.fromJson(jsonDecode(response.body));
      pageno.value = ResPage.fromJson(jsonDecode(response.body)).pageno!;
      cList.value = [];
      cList = cList + dataList.value.data;
      if (ResPage.fromJson(jsonDecode(response.body)).data.length == 0) {
        load = RxBool(false);
      } else {
        load = RxBool(true);
      }
      isLoading.value = false;
    });
  }

  void setLoading(bool e) {
    isLoading.value = e;
  }

  void setJudul(String name) {
    judul_cerita.value = name;
  }

  @override
  void onInit() {
    listCerita(pageno.value, judul_cerita.value);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
