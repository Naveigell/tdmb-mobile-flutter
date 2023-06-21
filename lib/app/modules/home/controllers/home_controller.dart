import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/models/response_data.dart';
import 'package:tdmb2/app/models/response_single.dart';
import 'package:tdmb2/app/modules/home/berita_model.dart';
import 'package:tdmb2/app/modules/home/providers/home_provider.dart';
import 'package:get/get.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/localstorage.dart';
import '../home_model.dart';

class HomeController extends GetxController {
  final user = GetStorage();

  Rx<ResData> dataList = ResData(data: []).obs;

  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging;
  // var _message = FirebaseMessaging.instance.getInitialMessage();

  // var _trx;
  // List<dynamic> get trx => _trx;

  // Future<void> fetchTransactions() {
  //   return ProductProvider()
  //       .fetchProducts()
  //       .then((response) => {_trx = response});

  //   // ProductProvider
  //   // return ProductProvider.fet()
  //   //     .then((response) {
  //   //       if (response != null) _trx = TransactionModel.fromJson(response);
  //   //     })
  //   //     .catchError((err) => print('Error!!!!! : $err'))
  //   //     .whenComplete(() => _dataAvailable.value = _trx != null);
  // }

  // var trx = <List<dynamic>>([]);

  // var _trx;
  // List<CustomCarousel> get trx => _trx;
  // var cList = [].obs;
  // void carousel() {
  //   cList.add(
  //       {"title": dataHome.value.slider1Title, "path": dataHome.value.slider1});
  //   cList.add(
  //       {"title": dataHome.value.slider2Title, "path": dataHome.value.slider2});
  //   cList.add(
  //       {"title": dataHome.value.slider3Title, "path": dataHome.value.slider3});
  // }

  void logout() {
    Get.snackbar("Keluar Berhasil", "Anda berhasil keluar dari aplikasi",
        colorText: Colors.white, backgroundColor: Colors.green.shade800);

    user.remove("pasien_id");
    user.remove("pasien_nik");
    user.remove("pasien_foto");
    user.remove("pasien_telp");
    user.remove("pasien_token_fcm");
    user.remove("pasien_alamat");
    user.remove("pasien_email");
    user.remove("pasien_nama");
    user.remove("pasien_token");
    user.remove("nakes");
    user.remove("nakes_posisi");

    Timer(Duration(seconds: 1), () {
      Get.offAllNamed(Routes.LANDING);
    });
  }

  Future<void> _handleNotification(Map<dynamic, dynamic> message) async {
    var data = message['data'] ?? message;
    String screen = data['screen'];
    String id = data['id'];

    // if (screen == 'MOHON_DETAIL') {
    //   Get.toNamed(Routes.MOHON_DETAIL, arguments: {'id': '${id}'});
    // } else if (screen == 'KEBERATAN_DETAIL') {
    //   Get.toNamed(Routes.KEBERATAN_DETAIL, arguments: {'id': '${id}'});
    // } else {
    //   Get.toNamed(Routes.HOME, arguments: {'id': '${id}'});
    // }
  }

  RxBool isLoading = true.obs;
  RxBool isExist = false.obs;
  RxString jadwal_id = ''.obs;

  Future<void> jadwalHariIni() {
    return HomeProvider()
        .jadwalHariIni(user.read("pasien_nik"), user.read("pasien_token"))
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        isLoading.value = false;
        if (ResSingle.fromJson(response.body).status == true) {
          isExist.value = true;
          jadwal_id.value =
              ResSingle.fromJson(response.body).data['jadwal_poli_id'];
        } else {}
      }
    });
  }

  // Future<void> slider() {
  //   return HomeProvider().slider(user.read("pasien_token")).then((response) {
  //     if (response.statusCode == 401) {
  //       clearSession();
  //     } else {
  //       isLoading.value = false;
  //       if (ResData.fromJson(response.body).status == true) {
  //         dataList.value = ResData.fromJson(response.body);
  //       } else {}
  //     }
  //   });
  // }

  void pullRefresh() {
    // getHome();
    // getBerita();
    // getBeritaInstansi();
    // getProfilPemkab();
  }

  @override
  void onInit() {
    // getHome();
    // getBerita();
    // getBeritaInstansi();
    // getProfilPemkab();

    // workaround for onLaunch: When the app is completely closed (not in the background) and opened directly from the push notification
    // FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then((RemoteMessage? message) {
    //   if (message != null) {
    //     _handleNotification(message.data);
    //   }
    // });
    //
    // // onMessage: When the app is open and it receives a push notification
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print("onMessage data: ${message.data}");
    // });
    //
    // // replacement for onResume: When the app is in the background and opened directly from the push notification.
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   _handleNotification(message.data);
    // });
    // if (user.read("pasien_nik") != null) {
    //   if (user.read("nakes") == '1' && user.read("nakes_posisi") == '1') {
    //     jadwalHariIni();
    //     slider();
    //   } else {
    //     slider();
    //   }
    // } else {
    //   slider();
    // }

    isLoading.value = false;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
