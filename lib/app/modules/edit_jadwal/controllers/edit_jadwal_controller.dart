import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/models/response_api.dart';
import 'package:tdmb2/app/models/response_data.dart';
import 'package:tdmb2/app/modules/edit_jadwal/providers/edit_jadwal_provider.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/localstorage.dart';
import 'package:intl/intl.dart';

class EditJadwalController extends GetxController {
  final user = GetStorage();
  String id = Get.arguments['jadwal_id'];
  String jadwal_poli_tanggal = Get.arguments['jadwal_poli_tanggal'];
  String jadwal_poli_max_antrian = Get.arguments['jadwal_poli_max_antrian'];
  String jadwal_poli_jam_mulai = Get.arguments['jadwal_poli_jam_mulai'];
  String jadwal_poli_jam_selesai = Get.arguments['jadwal_poli_jam_selesai'];

  var textJamMulai = TextEditingController();
  var textJamSelesai = TextEditingController();
  var textTglMulai = TextEditingController();

  RxString poli = ''.obs;
  RxString maxantre = ''.obs;
  RxString jammulai = ''.obs;
  RxString jamselesai = ''.obs;
  RxString tglmulai = ''.obs;

  RxBool isLoading = false.obs;

  Future<void> editJadwal(String tglmulai2, String jammulai2,
      String jamselesai2, String maxantrean2) {
    return EditJadwalProvider()
        .editJadwal(tglmulai2, jammulai2, jamselesai2, maxantrean2, id,
            user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        isLoading.value = false;
        if (ResponseApi.fromJson(response.body).status == true) {
          Get.snackbar("Berhasil", ResponseApi.fromJson(response.body).message!,
              colorText: Colors.white, backgroundColor: Colors.green.shade800);
          Timer(Duration(seconds: 1), () {
            Get.offAllNamed(Routes.JADWAL);
          });
        } else {
          Get.snackbar("Gagal", ResponseApi.fromJson(response.body).message!,
              colorText: Colors.white, backgroundColor: Colors.red.shade800);
        }
      }
    });
  }

  void setDropdown(String kat) {
    poli.value = kat;
  }

  void setMaxAntre(String kat) {
    maxantre.value = kat;
  }

  void setJamMulai(String kat) {
    jammulai.value = kat;
  }

  void setJamSelesai(String kat) {
    jamselesai.value = kat;
  }

  void setTglMulai(String kat) {
    tglmulai.value = kat;
  }

  void setLoading(bool e) {
    isLoading.value = e;
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd');
    final DateFormat serverFormater = DateFormat('dd MMMM yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  @override
  void onInit() {
    textTglMulai.text = convertDateTimeDisplay(jadwal_poli_tanggal);
    setTglMulai(jadwal_poli_tanggal);
    textJamMulai.text = jadwal_poli_jam_mulai;
    setJamMulai(jadwal_poli_jam_mulai);
    textJamSelesai.text = jadwal_poli_jam_selesai;
    setJamSelesai(jadwal_poli_jam_selesai);
    setMaxAntre(jadwal_poli_max_antrian);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
