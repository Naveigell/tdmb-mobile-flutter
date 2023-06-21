import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/cerita_controller.dart';
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

class CeritaView extends GetView<CeritaController> {
  final _scrollController = ScrollController();

  final obj = Get.put(CeritaController());

  Future<void> _pullRefresh() async {
    controller.setLoading(true);
    controller.listCeritaRefresh(1, controller.judul_cerita.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: _colorFromHex("FFFFFF")),
        backgroundColor: _colorFromHex("6F1445"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () async {
            if (await confirm(
              context,
              title: Text('Konfirmasi', style: TextStyle(fontFamily: "bold")),
              content: Text(
                'Yakin keluar dari cerita?',
                style: TextStyle(fontFamily: "regular"),
              ),
              textOK: Text('Ya',
                  style: TextStyle(
                      fontFamily: "regular", color: _colorFromHex("AF0C0C"))),
              textCancel: Text('Tidak',
                  style: TextStyle(
                      fontFamily: "regular", color: _colorFromHex("AF0C0C"))),
            )) {
              Navigator.pop(context);
            }
            return print('pressedCancel');
          },
        ),
        title: Text(
          'Kumpulan Daftar Satua Bali',
          style: TextStyle(
              fontSize: 17.0, fontFamily: 'medium', color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return Preloader();
        } else {
          return NotificationListener<ScrollEndNotification>(
              onNotification: (scrollEnd) {
                var metrics = scrollEnd.metrics;
                if (metrics.atEdge) {
                  if (metrics.pixels == 0) {
                    print('At top');
                  } else {
                    if (controller.load.value == true) {
                      controller.listCerita(controller.pageno.value + 1,
                          controller.judul_cerita.value);
                    } else {
                      print('stop get Data');
                    }
                  }
                }

                return true;
              },
              child: RefreshIndicator(
                color: _colorFromHex("6F1445"),
                onRefresh: () => _pullRefresh(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                top: 20, left: 25, right: 25, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        initialValue:
                                            controller.judul_cerita.value,
                                        onChanged: (value) {
                                          EasyDebounce.debounce(
                                              'my-debouncer', // <-- An ID for this particular debouncer
                                              Duration(
                                                  milliseconds:
                                                      1000), // <-- The debounce duration
                                              () {
                                            controller.setJudul(value);
                                            controller.listCeritaRefresh(1,
                                                controller.judul_cerita.value);
                                          } // <-- The target method
                                              );
                                        },
                                        cursorColor: _colorFromHex("6F1445"),
                                        style: TextStyle(
                                            fontFamily: "regular",
                                            fontSize: 13.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            hoverColor: Colors.black,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                            ),
                                            hintStyle: TextStyle(
                                                fontFamily: "regular",
                                                fontSize: 13),
                                            fillColor: Colors.grey[200],
                                            filled: true,
                                            focusColor: Colors.grey,
                                            hintText: 'Cari Cerita...'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              physics: ClampingScrollPhysics(),
                              controller: _scrollController,
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              shrinkWrap: true,
                              itemCount: controller.cList.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemCerita(
                                    controller: controller, index: index);
                              }),
                        ],
                      )),
                ),
              ));
        }
      }),
    );
  }
}

class ItemCerita extends StatelessWidget {
  const ItemCerita({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final CeritaController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_CERITA, arguments: {
          'cerita_id': controller.cList.value[index]['cerita_id'],
          'cerita_judul': controller.cList.value[index]['cerita_judul'],
          'cerita_isi': controller.cList.value[index]['cerita_isi'],
          'cerita_foto': controller.cList.value[index]['cerita_foto'],
          'cerita_bg': controller.cList.value[index]['cerita_bg'],
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
        width: double.infinity,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage('$urlImgCerita' +
                                    controller.cList.value[index]
                                        ['cerita_foto'])),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.cList.value[index]['cerita_judul']}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontFamily: "medium", fontSize: 16),
                            ),
                            // Text(
                            //   "${controller.cList.value[index]['manajemen_nama']}",
                            //   maxLines: 1,
                            //   overflow: TextOverflow.ellipsis,
                            //   style: TextStyle(fontFamily: "regular"),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
