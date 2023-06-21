import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:tdmb2/app/widgets/belum_masuk.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:intl/intl.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shirne_dialog/shirne_dialog.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../controllers/antre_pasien_controller.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss');
  final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertDateTimeDisplay2(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertDateTimeDisplay4(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('dd MMMM yyyy');
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

class AntrePasienView extends GetView<AntrePasienController> {
  final AntrePasienController _tabx = Get.put(AntrePasienController());
  final user = GetStorage();
  final _scrollController = ScrollController();

  Future<void> _pullRefresh() async {
    controller.setLoading(true);
    controller.setTgl("");
    controller.textTgl.text = "";
    controller.listAntrePasienRefresh(1, controller.tgl.value);
  }

  Future<void> _filterRefresh() async {
    controller.setLoading(true);
    controller.listAntrePasienRefresh(1, controller.tgl.value);
  }

  @override
  Widget build(BuildContext context) {
    MyDialog.initialize(
      context,
      MyDialogSetting(
        buttonTextOK: 'OK',
        buttonTextCancel: 'Cancel',
        primaryButtonStyle: ElevatedButton.styleFrom(
          elevation: 0,
          primary: _colorFromHex("AF0C0C"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        cancelButtonStyle: ElevatedButton.styleFrom(
          elevation: 0,
          onPrimary: _colorFromHex("AF0C0C"),
          primary: _colorFromHex("FFFFFF"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        modalSetting: ModalSetting(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
    if (user.read("pasien_nik") == null) {
      return BelumMasuk();
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[100],
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
                        controller.listAntrePasien(
                            controller.pageno.value + 1, controller.tgl.value);
                      } else {
                        print('stop get Data');
                      }
                    }
                  }

                  return true;
                },
                child: RefreshIndicator(
                  color: _colorFromHex("AF0C0C"),
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
                                  top: 20, left: 20, right: 20, bottom: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.textTgl,
                                      onTap: () {
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                        DatePicker.showDatePicker(context,
                                            showTitleActions: true,
                                            theme: DatePickerTheme(
                                                headerColor: Colors.white,
                                                backgroundColor: Colors.white,
                                                itemStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'regular',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                                cancelStyle: TextStyle(
                                                    fontFamily: 'regular',
                                                    color:
                                                        _colorFromHex("333333"),
                                                    fontSize: 16),
                                                doneStyle: TextStyle(
                                                    fontFamily: 'regular',
                                                    color:
                                                        _colorFromHex("AF0C0C"),
                                                    fontSize: 16)),
                                            onChanged: (date) {},
                                            onConfirm: (date) {
                                          controller.textTgl.text =
                                              convertDateTimeDisplay4(
                                                  date.toString());
                                          controller.setTgl(
                                              convertDateTimeDisplay2(
                                                  date.toString()));
                                          _filterRefresh();
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.id);
                                      },
                                      cursorColor: _colorFromHex("9B9B9B"),
                                      style: TextStyle(
                                          fontFamily: "NexaRegular",
                                          fontSize: 14.0,
                                          height: 0.8,
                                          color: Colors.black),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          hoverColor: Colors.black,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0),
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.calendar_today_rounded,
                                            color: Colors.grey,
                                          ),
                                          hintStyle: TextStyle(
                                              fontFamily: "regular",
                                              fontSize: 13),
                                          fillColor: Colors.grey[200],
                                          filled: true,
                                          focusColor: Colors.grey,
                                          hintText: 'Tanggal'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                                physics: ClampingScrollPhysics(),
                                controller: _scrollController,
                                padding: EdgeInsets.only(top: 15, bottom: 20),
                                shrinkWrap: true,
                                itemCount: controller.cList.value.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ItemJadwal(
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
}

class ItemJadwal extends StatelessWidget {
  const ItemJadwal({Key? key, required this.controller, required this.index})
      : super(key: key);

  final AntrePasienController controller;
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
                          Container(
                            margin: EdgeInsets.only(
                              top: 20,
                            ),
                            height: 200,
                            child: SfBarcodeGenerator(
                              value:
                                  '${controller.cList.value[index]['antri_poli_nreg']}',
                              symbology: QRCode(),
                              showValue: true,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                // Text(
                                //   "${controller.cList.value[index]['manajemen_nama']}",
                                //   style: TextStyle(
                                //       fontFamily: "medium", fontSize: 17),
                                //   textAlign: TextAlign.center,
                                // ),

                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dokter",
                                            style: TextStyle(
                                                fontFamily: 'regular',
                                                color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    "${controller.cList.value[index]['manajemen_nama']}",
                                                    style: TextStyle(
                                                      fontFamily: 'medium',
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10,
                                                        left: 10,
                                                        right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${controller.cList.value[index]['rating']}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'medium',
                                                              fontSize: 16),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          width: 24,
                                                          child: Image.asset(
                                                              'assets/images/star.png'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Poli",
                                            style: TextStyle(
                                                fontFamily: 'regular',
                                                color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "${controller.cList.value[index]['poli_nama']}",
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                            ),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      )),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tanggal Jadwal",
                                            style: TextStyle(
                                                fontFamily: 'regular',
                                                color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "${convertDateTimeDisplay3(controller.cList.value[index]['jadwal_poli_tanggal'])}",
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                            ),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // Expanded(
                                      //     child: Column(
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   children: [
                                      //     Text(
                                      //       "Max. Antrean",
                                      //       style: TextStyle(
                                      //           fontFamily: 'regular',
                                      //           color: Colors.grey),
                                      //       textAlign: TextAlign.left,
                                      //     ),
                                      //     Text(
                                      //       "${controller.cList.value[index]['jadwal_poli_max_antrian']} Orang",
                                      //       style: TextStyle(
                                      //         fontFamily: 'medium',
                                      //       ),
                                      //       textAlign: TextAlign.left,
                                      //     )
                                      //   ],
                                      // )),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Antrean depan Anda",
                                            style: TextStyle(
                                                fontFamily: 'regular',
                                                color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "${controller.cList.value[index]['antrian_didepan']} Orang",
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                            ),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      )),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Pukul",
                                            style: TextStyle(
                                                fontFamily: 'regular',
                                                color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "${controller.cList.value[index]['jadwal_poli_jam_mulai'].substring(0, 5)} - ${controller.cList.value[index]['jadwal_poli_jam_selesai'].substring(0, 5)}",
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                            ),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Antrean Aktif",
                                            style: TextStyle(
                                                fontFamily: 'regular',
                                                color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "${controller.cList.value[index]['antrian_aktif']} ",
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                            ),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      )),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "No. Antre Anda",
                                            style: TextStyle(
                                                fontFamily: 'regular',
                                                color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "${controller.cList.value[index]['antri_poli_nomor']}",
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                            ),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Builder(builder: (context) {
                            if (controller.cList.value[index]
                                    ['antri_poli_antri_status_id'] ==
                                "1") {
                              return Container(
                                margin: EdgeInsets.only(top: 30, bottom: 60),
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(13)),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                _colorFromHex("FFFFFFF")),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                _colorFromHex("C90000")),
                                        elevation: MaterialStateProperty
                                            .resolveWith<double>(
                                          // As you said you dont need elevation. I'm returning 0 in both case
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.disabled)) {
                                              return 0;
                                            }
                                            return 0; // Defer to the widget's default.
                                          },
                                        ),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ))),
                                    child: Text(
                                      'Batal Antre',
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          color: Colors.white,
                                          fontSize: 17),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);

                                      controller.setLoading(true);
                                      controller.batalAntre(
                                          controller.cList.value[index]
                                              ['antri_poli_id'],
                                          index);
                                    }),
                              );
                            } else {
                              return SizedBox(
                                height: 100,
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        width: double.infinity,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
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
                                    fit: BoxFit.cover,
                                    image: NetworkImage('$urlImg' +
                                        controller.cList.value[index]
                                            ['pasien_foto'])),
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
                                  "${controller.cList.value[index]['poli_nama']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: "medium", fontSize: 16),
                                ),
                                Text(
                                  "${controller.cList.value[index]['manajemen_nama']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontFamily: "regular"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 5),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //           margin: EdgeInsets.only(top: 10, right: 10),
                      //           // padding: EdgeInsets.only(),
                      //           child: Text(
                      //             "Antrean di depan:",
                      //             style: TextStyle(
                      //                 fontFamily: "regular", color: Colors.grey),
                      //           )),
                      //       Container(
                      //           margin: EdgeInsets.only(top: 10),
                      //           child: Text(
                      //             "${controller.cList.value[index]['antrian_didepan']} Orang",
                      //             style: TextStyle(
                      //                 fontFamily: "medium", color: Colors.grey),
                      //           )),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 10, right: 10),
                                // padding: EdgeInsets.only(),
                                child: Text(
                                  "Tanggal:",
                                  style: TextStyle(
                                      fontFamily: "regular",
                                      color: Colors.grey),
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: _colorFromHex("F8F8F8"),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: Text(
                                  "${convertDateTimeDisplay3(controller.cList.value[index]['jadwal_poli_tanggal'])}",
                                  style: TextStyle(
                                      fontFamily: "regular",
                                      color: Colors.grey),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Builder(builder: (context) {
                    if (convertDateTimeDisplay2(DateTime.now().toString()) ==
                        controller.cList.value[index]['jadwal_poli_tanggal']) {
                      return Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Color(0xFFAF0C0C),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                        fontFamily: "regular",
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "${controller.cList.value[index]['antri_poli_nomor']}",
                                  style: TextStyle(
                                      fontFamily: "regular",
                                      color: Colors.white,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ));
                    } else {
                      return Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: _colorFromHex("F8F8F8"),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                        fontFamily: "regular",
                                        color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  "${controller.cList.value[index]['antri_poli_nomor']}",
                                  style: TextStyle(
                                      fontFamily: "regular",
                                      color: Colors.grey,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ));
                    }
                  }),
                ),
              ],
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Expanded(
            //           child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "Antrean Aktif",
            //             style: TextStyle(
            //                 fontFamily: 'regular', color: Colors.grey),
            //             textAlign: TextAlign.left,
            //           ),
            //           Text(
            //             "${controller.cList.value[index]['antrian_aktif']} ",
            //             style: TextStyle(
            //               fontFamily: 'medium',
            //             ),
            //             textAlign: TextAlign.left,
            //           )
            //         ],
            //       )),
            //       Expanded(
            //           child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "Antrean didepan",
            //             style: TextStyle(
            //                 fontFamily: 'regular', color: Colors.grey),
            //             textAlign: TextAlign.left,
            //           ),
            //           Text(
            //             "${controller.cList.value[index]['antrian_didepan']} Orang",
            //             style: TextStyle(
            //               fontFamily: 'medium',
            //             ),
            //             textAlign: TextAlign.left,
            //           )
            //         ],
            //       )),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
