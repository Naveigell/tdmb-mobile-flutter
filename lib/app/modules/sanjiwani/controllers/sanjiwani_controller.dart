import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/models/response_page.dart';
import 'package:tdmb2/app/modules/sanjiwani/providers/sanjiwani_provider.dart';
import 'package:tdmb2/app/utils/localstorage.dart';
import 'package:intl/intl.dart';

class SanjiwaniController extends GetxController {
  final user = GetStorage();
  String faskes = "2207R001";

  RxBool isLoading = true.obs;
  var textTglMulai = TextEditingController();
  RxString tglmulai = ''.obs;
  RxString tglmulaidepan = ''.obs;
  RxString poli_nama = ''.obs;
  RxInt pageno = 1.obs;

  Rx<ResPage> dataList = ResPage(data: []).obs;
  RxList<dynamic> cList = [].obs;
  RxBool load = false.obs;

  // RxBool isSuccess = true.obs;
  // RxString isMessage = ''.obs;

  void setLoading(bool e) {
    isLoading.value = e;
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  String convertDateTimeDisplay3(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd');
    final DateFormat serverFormater = DateFormat('dd MMMM yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  void setTglMulai(String kat) {
    tglmulai.value = kat;
  }

  void setTglMulaiDepan(String kat) {
    tglmulaidepan.value = kat;
  }

  void setNamaPoli(String kat) {
    poli_nama.value = kat;
  }

  Future<void> listJadwalAntre(int pgno, String tanggal, String nama) {
    return SanjiwaniProvider()
        .listJadwalAntre(faskes, pgno, tanggal, nama, user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        print(response.body);
        dataList.value = ResPage.fromJson(response.body);
        pageno.value = ResPage.fromJson(response.body).pageno!;
        cList = cList + dataList.value.data;

        if (ResPage.fromJson(response.body).data.length == 0) {
          load = RxBool(false);
        } else {
          load = RxBool(true);
        }
        isLoading.value = false;
      }
    });
  }

  Future<void> listJadwalAntreRefresh(int pgno, String tanggal, String nama) {
    return SanjiwaniProvider()
        .listJadwalAntre(faskes, pgno, tanggal, nama, user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        dataList.value = ResPage.fromJson(response.body);
        pageno.value = ResPage.fromJson(response.body).pageno!;
        cList.value = [];
        cList = cList + dataList.value.data;
        if (ResPage.fromJson(response.body).data.length == 0) {
          load = RxBool(false);
        } else {
          load = RxBool(true);
        }
        isLoading.value = false;
      }
    });
  }

  Future<ResPage> ambilAntre(String jadwal_id) {
    return SanjiwaniProvider()
        .ambilAntre(
            jadwal_id, user.read("pasien_nik"), user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        isLoading.value = false;
      }
      return ResPage.fromJson(response.body);
    });
  }

  @override
  void onInit() {
    textTglMulai.text = convertDateTimeDisplay3(DateTime.now().toString());
    tglmulai.value = convertDateTimeDisplay(DateTime.now().toString());
    tglmulaidepan.value = convertDateTimeDisplay(DateTime.now().toString());

    listJadwalAntre(pageno.value, tglmulaidepan.value, poli_nama.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
