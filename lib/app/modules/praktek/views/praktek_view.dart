import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/praktek_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

showAlertDialog(BuildContext context, String title, String desc) {
  // set up the button
  Widget okButton = FlatButton(
    color: Colors.white,
    child: Text("OK",
        style: TextStyle(
            fontFamily: "semibold", fontSize: 14.0, color: Colors.black)),
    onPressed: () {
      Get.toNamed(Routes.LOGIN);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("${title}",
        style: TextStyle(fontFamily: "semibold", fontSize: 16.0)),
    content: Text("${desc}",
        style: TextStyle(
          fontFamily: "regular",
          fontSize: 14.0,
        )),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class PraktekView extends GetView<PraktekController> {
  final obj = Get.put(PraktekController());

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
                title: Text('Konfirmasi', style: TextStyle(fontFamily: "bold")),
                content: Text(
                  'Yakin keluar dari soal prakter?',
                  style: TextStyle(fontFamily: "regular"),
                ),
                textOK: Text('Ya',
                    style: TextStyle(
                        fontFamily: "regular", color: _colorFromHex("AF0C0C"))),
                textCancel: Text('Tidak',
                    style: TextStyle(
                        fontFamily: "regular", color: _colorFromHex("AF0C0C"))),
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
            'Soal Praktek',
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
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return Preloader();
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   padding:
                //       EdgeInsets.only(top: 40, right: 30, left: 30, bottom: 5),
                //   child: Text("Pendaftaran",
                //       textAlign: TextAlign.left,
                //       style: TextStyle(
                //           fontFamily: "medium",
                //           fontSize: 25.0,
                //           color: Colors.black)),
                // ),

                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 20),
                  child: Text(
                      "Silahkan mempelajari teknik dasar mesatua Bali yang sudah dipaparkan! Kemudian dipraktekan dengan memilih judul cerita pada menu sebelumnya. Setelah dipelajari kemudian upload vidionya berupa link pada menu dibawah!",
                      style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 15.0,
                          color: Colors.grey)),
                ),

                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
                  child: Text("Kode Pelajaran",
                      style:
                          TextStyle(fontFamily: "medium", color: Colors.grey)),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    onChanged: (value) => controller.setKode(value),
                    cursorColor: _colorFromHex("6F1445"),
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 13.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Kode Pelajaran'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: Text("Link Video Youtube",
                      style:
                          TextStyle(fontFamily: "medium", color: Colors.grey)),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    onChanged: (value) => controller.setLink(value),
                    cursorColor: _colorFromHex("6F1445"),
                    maxLines: null,
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 13.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Link Video Youtube'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 0),
                  child: Text("Panduan Upload Video ke Youtube",
                      style: TextStyle(
                          fontFamily: "medium",
                          fontSize: 14.0,
                          color: Colors.black)),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("1",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text("Login ke YouTube",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("2",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text("Di bagian atas halaman klik Upload",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("3",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text("Pilih Upload video",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("4",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text(
                                "Sebelum mulai mengupload video, kamu dapat memilih setelan privasi video",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("5",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text("Pilih video yang ingin diupload",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("6",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text(
                                "Saat video diupload, kamu dapat mengedit informasi dasar dan setelan lanjutan untuk video tersebut, serta menentukan apakah ingin mengirimkan notifikasi kepada subscriber atau tidak (jika kamu menghapus centang opsi ini, subscriber tidak akan mendapatkan notifikasi). Partner juga dapat menyesuaikan setelan Monetisasi. Kamu dapat membuat judul video dengan panjang hingga 100 karakter dan deskripsi hingga 5.000 karakter",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("7",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text(
                                "Klik Publikasikan untuk menyelesaikan proses upload video publik ke YouTube. Jika kamu mengatur setelan privasi video ke “Pribadi (private) atau Tidak Publik”, cukup klik “Selesai” untuk menyelesaikan upload, atau klik bagikan untuk berbagi video secara pribadi",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("8",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text(
                                "Jika kamu belum mengklik “Publikasikan”, video tidak dapat dilihat orang lain. Kamu dapat memublikasikan video kapan saja di “Pengelola Video”",
                                style: TextStyle(
                                    fontFamily: "regular",
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: Text("Catatan",
                      style:
                          TextStyle(fontFamily: "medium", color: Colors.grey)),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    onChanged: (value) => controller.setCatatan(value),
                    cursorColor: _colorFromHex("6F1445"),
                    maxLines: null,
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 13.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Catatan'),
                  ),
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
                        'Kirim',
                        style: TextStyle(
                            fontFamily: 'bold',
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      onPressed: () {
                        controller.setLoading(true);

                        if (controller.kode == '' || controller.link == '') {
                          controller.setLoading(false);
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(
                              message: "Cek kembali inputan form Anda",
                            ),
                          );
                        } else {
                          controller.setLoading(true);
                          controller.tambahSoal(
                            controller.kode.value,
                            controller.link.value,
                            controller.catatan.value,
                          );

                          // if (controller.title.value != '') {
                          //   showAlertDialog(context, controller.title.value,
                          //       controller.desc.value);
                          // }
                        }
                      }),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
