import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/mulai_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class MulaiView extends GetView<MulaiController> {
  final obj = Get.put(MulaiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () async {
                if (await confirm(
                  context,
                  title:
                      Text('Konfirmasi', style: TextStyle(fontFamily: "bold")),
                  content: Text(
                    'Yakin keluar dari soal objektif?',
                    style: TextStyle(fontFamily: "regular"),
                  ),
                  textOK: Text('Ya',
                      style: TextStyle(
                          fontFamily: "regular",
                          color: _colorFromHex("AF0C0C"))),
                  textCancel: Text('Tidak',
                      style: TextStyle(
                          fontFamily: "regular",
                          color: _colorFromHex("AF0C0C"))),
                )) {
                  Get.offAllNamed(Routes.LANDING);
                }
                return print('pressedCancel');
              },
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.more_horiz_rounded),
              ),
            ],
            title: Text(
              'Soal Objektif',
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
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 30, left: 30, bottom: 5),
                  child: Lottie.asset('assets/animasi/exam.json'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: Text(
                      "Soal objektif terdiri dari 20 soal, Silahkan pilih jawaban yang menurut Anda benar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 15.0,
                          color: Colors.grey)),
                ),
                Container(
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
                        'Mulai',
                        style: TextStyle(
                            fontFamily: 'bold',
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      onPressed: () {
                        Get.offAllNamed(Routes.OBJEKTIF);
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
