import 'package:easy_debounce/easy_debounce.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/list_praktek_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss');
  final DateFormat serverFormater = DateFormat('dd MMM yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
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

class ListPraktekView extends GetView<ListPraktekController> {
  final _scrollController = ScrollController();

  final obj = Get.put(ListPraktekController());

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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Nilai Praktek',
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
                                            hintText: 'Cari Kode...'),
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

  final ListPraktekController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMaterialModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16))),
                child: Container(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0, bottom: 2.0),
                      // color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text(
                            "Nilai",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: "regular",
                                color: Colors.grey,
                                fontSize: 16),
                          ),
                          Builder(builder: (context) {
                            if (controller.cList.value[index]
                                    ['praktek_nilai'] ==
                                null) {
                              return Text(
                                "Belum Dinilai",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: "medium", fontSize: 25),
                              );
                            } else {
                              return Text(
                                "${controller.cList.value[index]['praktek_nilai']}",
                                maxLines: 1,
                                style: TextStyle(
                                    fontFamily: "medium", fontSize: 25),
                              );
                            }
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Catatan",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: "regular",
                                color: Colors.grey,
                                fontSize: 16),
                          ),
                          Builder(builder: (context) {
                            if (controller.cList.value[index]
                                    ['praktek_catatan_penilai'] ==
                                null) {
                              return Container();
                            } else {
                              return Text(
                                "${controller.cList.value[index]['praktek_catatan_penilai']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "regular", fontSize: 16),
                              );
                            }
                          }),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
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
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.cList.value[index]['praktek_kode']}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontFamily: "medium", fontSize: 16),
                            ),
                            Text(
                              "${convertDateTimeDisplay(controller.cList.value[index]['praktek_created_at'])}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontFamily: "regular"),
                            ),
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
