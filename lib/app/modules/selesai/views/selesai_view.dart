import 'package:lottie/lottie.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/selesai_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class SelesaiView extends GetView<SelesaiController> {
  final obj = Get.put(SelesaiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Hasil',
              style: TextStyle(fontFamily: 'bold', color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xFF6F1445), Color(0xFF6F1445)])),
            )),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 30, left: 30, bottom: 5),
                  child: Lottie.asset('assets/animasi/selesai.json'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: Text(
                      "Yeay! Selamat telah menyelesaikan soal objektif. Total skor Anda adalah",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 15.0,
                          color: Colors.grey)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: Text(
                      "${Get.arguments['nilai'].toString().substring(0, Get.arguments['nilai'].toString().length - 2)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "bold",
                          fontSize: 30.0,
                          color: Colors.black)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                      child: Text(
                          "Benar: ${Get.arguments['benar'].toString().substring(0, Get.arguments['benar'].toString().length - 2)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "regular",
                              fontSize: 16.0,
                              color: Colors.grey)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                      child: Text(
                          "Salah: ${Get.arguments['salah'].toString().substring(0, Get.arguments['salah'].toString().length - 2)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "regular",
                              fontSize: 16.0,
                              color: Colors.grey)),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(13)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade100),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade50),
                          elevation: MaterialStateProperty.resolveWith<double>(
                            // As you said you dont need elevation. I'm returning 0 in both case
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return 0;
                              }
                              return 0; // Defer to the widget's default.
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      child: Text(
                        'Selesai',
                        style: TextStyle(
                            fontFamily: 'bold',
                            color: _colorFromHex("6F1445"),
                            fontSize: 15),
                      ),
                      onPressed: () {
                        Get.offAllNamed(Routes.LANDING);
                      }),
                ),
                Builder(builder: (context) {
                  if (int.parse(Get.arguments['nilai'].toString().substring(
                          0, Get.arguments['nilai'].toString().length - 2)) >=
                      85) {
                    return Container(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(13)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  _colorFromHex("FFFFFFF")),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  _colorFromHex("6F1445")),
                              elevation:
                                  MaterialStateProperty.resolveWith<double>(
                                // As you said you dont need elevation. I'm returning 0 in both case
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return 0;
                                  }
                                  return 0; // Defer to the widget's default.
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          child: Text(
                            'Pembahasan',
                            style: TextStyle(
                                fontFamily: 'bold',
                                color: Colors.white,
                                fontSize: 15),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.PEMBAHASAN, arguments: {
                              "soal": Get.arguments['soal'],
                              "jawaban": Get.arguments['jawaban']
                            });
                          }),
                    );
                  } else {
                    return Container();
                  }
                }),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ));
  }
}
