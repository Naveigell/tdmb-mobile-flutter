import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tdmb2/app/models/response_data.dart';
import 'package:tdmb2/app/modules/objektif/providers/objektif_provider.dart';
import 'package:tdmb2/app/routes/app_pages.dart';

class ObjektifController extends GetxController {
  RxInt currentPageValue = 0.obs;

  Rx<ResData> dataList = ResData(data: []).obs;
  RxList<dynamic> cList = [].obs;
  RxList<dynamic> jawaban = [].obs;

  RxBool load = false.obs;

  RxBool isLoading = true.obs;

  RxInt soal1 = 0.obs;
  RxInt soal2 = 0.obs;
  RxInt soal3 = 0.obs;
  RxInt soal4 = 0.obs;
  RxInt soal5 = 0.obs;
  RxInt soal6 = 0.obs;
  RxInt soal7 = 0.obs;
  RxInt soal8 = 0.obs;
  RxInt soal9 = 0.obs;
  RxInt soal10 = 0.obs;
  RxInt soal11 = 0.obs;
  RxInt soal12 = 0.obs;
  RxInt soal13 = 0.obs;
  RxInt soal14 = 0.obs;
  RxInt soal15 = 0.obs;
  RxInt soal16 = 0.obs;
  RxInt soal17 = 0.obs;
  RxInt soal18 = 0.obs;
  RxInt soal19 = 0.obs;
  RxInt soal20 = 0.obs;

  void setSoal1(int val) {
    soal1.value = val;
  }

  void setSoal2(int val) {
    soal2.value = val;
  }

  void setSoal3(int val) {
    soal3.value = val;
  }

  void setSoal4(int val) {
    soal4.value = val;
  }

  void setSoal5(int val) {
    soal5.value = val;
  }

  void setSoal6(int val) {
    soal6.value = val;
  }

  void setSoal7(int val) {
    soal7.value = val;
  }

  void setSoal8(int val) {
    soal8.value = val;
  }

  void setSoal9(int val) {
    soal9.value = val;
  }

  void setSoal10(int val) {
    soal10.value = val;
  }

  void setSoal11(int val) {
    soal11.value = val;
  }

  void setSoal12(int val) {
    soal12.value = val;
  }

  void setSoal13(int val) {
    soal13.value = val;
  }

  void setSoal14(int val) {
    soal14.value = val;
  }

  void setSoal15(int val) {
    soal15.value = val;
  }

  void setSoal16(int val) {
    soal16.value = val;
  }

  void setSoal17(int val) {
    soal17.value = val;
  }

  void setSoal18(int val) {
    soal18.value = val;
  }

  void setSoal19(int val) {
    soal19.value = val;
  }

  void setSoal20(int val) {
    soal20.value = val;
  }

  Future<void> listSoal() {
    return ObjektifProvider().soal().then((response) {
      dataList.value = ResData.fromJson(jsonDecode(response.body));
      cList = cList + dataList.value.data;

      if (ResData.fromJson(jsonDecode(response.body)).data.length == 0) {
        load = RxBool(false);
      } else {
        load = RxBool(true);
      }
      isLoading.value = false;
    });
  }

  void selesai() {
    var listJawaban = [
      soal1.value,
      soal2.value,
      soal3.value,
      soal4.value,
      soal5.value,
      soal6.value,
      soal7.value,
      soal8.value,
      soal9.value,
      soal10.value,
      soal11.value,
      soal12.value,
      soal13.value,
      soal14.value,
      soal15.value,
      soal16.value,
      soal17.value,
      soal18.value,
      soal19.value,
      soal20.value,
    ];

    double benar = 0;
    double salah = 0;
    double nilai = 0;

    for (var i = 0; i < cList.value.length; i++) {
      for (var a = 0; a < cList.value[i]['jawaban'].length; a++) {
        if (cList.value[i]['jawaban'][a]['jawab_kunci'] == "1") {
          if (int.parse(cList.value[i]['jawaban'][a]['jawab_index']) ==
              listJawaban[i]) {
            print('disini');
            benar = benar + 1;
          } else {
            salah = salah + 1;
          }
        }
      }
    }

    nilai = benar / 20 * 100;

    Get.offAllNamed(Routes.SELESAI, arguments: {
      "benar": benar,
      "salah": salah,
      "nilai": nilai,
      "soal": cList.value,
      "jawaban": listJawaban
    });
  }

  void changePage(int number) {
    currentPageValue.value = number;
  }

  @override
  void onInit() {
    listSoal();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
