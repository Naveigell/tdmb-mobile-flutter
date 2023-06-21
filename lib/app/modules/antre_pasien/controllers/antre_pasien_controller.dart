import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/models/response_api.dart';
import 'package:tdmb2/app/models/response_page.dart';
import 'package:tdmb2/app/modules/antre_pasien/providers/antre_pasien_provider.dart';
import 'package:tdmb2/app/modules/jadwal/providers/jadwal_provider.dart';
import 'package:tdmb2/app/utils/localstorage.dart';

class AntrePasienController extends GetxController
    with SingleGetTickerProviderMixin {
  final user = GetStorage();
  var pageno = 1.obs;
  RxBool isLoading = true.obs;
  RxString tgl = ''.obs;
  Rx<ResPage> dataList = ResPage(data: []).obs;
  RxList<dynamic> cList = [].obs;
  RxBool load = false.obs;
  var textTgl = TextEditingController();

  Future<void> listAntrePasien(int pgno, String tanggal) {
    return AntrePasienProvider()
        .listAntrePasien(
            user.read('pasien_nik'), pgno, tanggal, user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
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

  Future<void> listAntrePasienRefresh(int pgno, String tanggal) {
    load.value = false;
    return AntrePasienProvider()
        .listAntrePasien(
            user.read('pasien_nik'), pgno, tanggal, user.read("pasien_token"))
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

  Future<void> batalAntre(String id, int index) {
    return AntrePasienProvider()
        .batalAntre(id, user.read("pasien_token"))
        .then((response) {
      cList.removeAt(index);
      if (response.statusCode == 401) {
        clearSession();
      } else {
        isLoading.value = false;
        if (ResponseApi.fromJson(response.body).status == true) {
          Get.snackbar(
              "Berhasil!", ResponseApi.fromJson(response.body).message!,
              colorText: Colors.white, backgroundColor: Colors.green.shade800);
        } else {
          Get.snackbar("Gagal", ResponseApi.fromJson(response.body).message!,
              colorText: Colors.white, backgroundColor: Colors.red.shade800);
        }
      }
    });
  }

  void setLoading(bool e) {
    isLoading.value = e;
  }

  void setTgl(String e) {
    tgl.value = e;
  }

  @override
  void onInit() {
    if (user.read("pasien_nik") != null) {
      listAntrePasien(pageno.value, tgl.value);
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
