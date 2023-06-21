import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/models/response_api.dart';
import 'package:tdmb2/app/models/response_page.dart';
import 'package:tdmb2/app/modules/antre_pasien/providers/antre_pasien_provider.dart';
import 'package:tdmb2/app/modules/detail_jadwal/providers/detail_jadwal_provider.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/localstorage.dart';

class DetailJadwalController extends GetxController
    with SingleGetTickerProviderMixin {
  String id = Get.arguments['jadwal_id'];

  final user = GetStorage();
  var pageno = 1.obs;
  RxBool isLoading = true.obs;
  RxString tgl = ''.obs;

  Rx<ResPage> dataList = ResPage(data: []).obs;
  RxList<dynamic> cList = [].obs;
  RxBool load = false.obs;
  var textTgl = TextEditingController();

  RxList<dynamic> statusList = [].obs;

  RxString photo = ''.obs;
  RxString nama = ''.obs;
  RxString poli = ''.obs;
  RxString tanggal = ''.obs;
  RxString max = ''.obs;
  RxString mulai = ''.obs;
  RxString selesai = ''.obs;
  RxString rating = ''.obs;

  RxInt jmltotal = 0.obs;
  Future<void> detailJadwal(int pgno) {
    return DetailJadwalProvider()
        .detailJadwal(id, pgno, user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        photo.value = ResPage.fromJson(response.body).master['manajemen_foto'];
        nama.value = ResPage.fromJson(response.body).master['manajemen_nama'];
        poli.value = ResPage.fromJson(response.body).master['poli_nama'];
        tanggal.value =
            ResPage.fromJson(response.body).master['jadwal_poli_tanggal'];
        max.value =
            ResPage.fromJson(response.body).master['jadwal_poli_max_antrian'];
        mulai.value =
            ResPage.fromJson(response.body).master['jadwal_poli_jam_mulai'];
        selesai.value =
            ResPage.fromJson(response.body).master['jadwal_poli_jam_selesai'];
        jmltotal.value = ResPage.fromJson(response.body).master['jumlah_antre'];
        rating.value = ResPage.fromJson(response.body).master['rating'];

        statusList.value = ResPage.fromJson(response.body).master['all_status'];

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

  Future<void> detailJadwalRefresh(int pgno) {
    load.value = false;
    return DetailJadwalProvider()
        .detailJadwal(id, pgno, user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        photo.value = ResPage.fromJson(response.body).master['manajemen_foto'];
        nama.value = ResPage.fromJson(response.body).master['manajemen_nama'];
        poli.value = ResPage.fromJson(response.body).master['poli_nama'];
        tanggal.value =
            ResPage.fromJson(response.body).master['jadwal_poli_tanggal'];
        max.value =
            ResPage.fromJson(response.body).master['jadwal_poli_max_antrian'];
        mulai.value =
            ResPage.fromJson(response.body).master['jadwal_poli_jam_mulai'];
        selesai.value =
            ResPage.fromJson(response.body).master['jadwal_poli_jam_selesai'];
        jmltotal.value = ResPage.fromJson(response.body).master['jumlah_antre'];
        rating.value = ResPage.fromJson(response.body).master['rating'];

        statusList.value = ResPage.fromJson(response.body).master['all_status'];

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

  Future<void> prosesAntre(
      String antri_poli_id, String tanggal, String status) {
    return DetailJadwalProvider()
        .prosesAntre(
            antri_poli_id, id, tanggal, status, user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        isLoading.value = false;

        if (ResponseApi.fromJson(response.body).status == true) {
          detailJadwalRefresh(1);
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

  Future<void> selesaiJadwal() {
    return DetailJadwalProvider()
        .selesaiJadwal(id, user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        isLoading.value = false;

        if (ResponseApi.fromJson(response.body).status == true) {
          Get.snackbar(
              "Berhasil!", ResponseApi.fromJson(response.body).message!,
              colorText: Colors.white, backgroundColor: Colors.green.shade800);
          Get.offAllNamed(Routes.JADWAL);
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
    detailJadwal(pageno.value);
    // listJadwal(pageno.value, tgl.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
