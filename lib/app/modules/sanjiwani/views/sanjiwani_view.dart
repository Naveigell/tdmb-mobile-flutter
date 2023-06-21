import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/utils/localstorage.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:intl/intl.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:easy_debounce/easy_debounce.dart';

import '../controllers/sanjiwani_controller.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertDateTimeDisplay2(String date) {
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

String convertDateTimeDisplay4(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('HH:mm');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertDateTimeDisplay5(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('HH:mm:ss');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

class SanjiwaniView extends GetView<SanjiwaniController> {
  final SanjiwaniController _tabx = Get.put(SanjiwaniController());
  final _scrollController = ScrollController();
  final user = GetStorage();

  Future<void> _pullRefresh() async {
    controller.setLoading(true);
    controller.listJadwalAntreRefresh(
        1, controller.tglmulaidepan.value, controller.poli_nama.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      controller.listJadwalAntre(
                          controller.pageno.value + 1,
                          controller.tglmulaidepan.value,
                          controller.poli_nama.value);
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
                                top: 20, left: 25, right: 25, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        initialValue:
                                            controller.poli_nama.value,
                                        onChanged: (value) {
                                          EasyDebounce.debounce(
                                              'my-debouncer', // <-- An ID for this particular debouncer
                                              Duration(
                                                  milliseconds:
                                                      1000), // <-- The debounce duration
                                              () {
                                            controller.setNamaPoli(value);
                                            controller.listJadwalAntreRefresh(
                                                1,
                                                controller.tglmulaidepan.value,
                                                controller.poli_nama.value);
                                          } // <-- The target method
                                              );
                                        },
                                        cursorColor: _colorFromHex("AF0C0C"),
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
                                            hintText: 'Cari Nama Poli...'),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(14)),
                                              foregroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      _colorFromHex("FFFFFFF")),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
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
                                          child: Icon(
                                            FontAwesome5.filter,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            controller.setTglMulai(
                                                controller.tglmulaidepan.value);
                                            controller.textTglMulai.text =
                                                convertDateTimeDisplay3(
                                                    controller
                                                        .tglmulaidepan.value);
                                            showMaterialModalBottomSheet(
                                                context: context,
                                                backgroundColor:
                                                    Colors.transparent,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.only(
                                                            topLeft: const Radius
                                                                .circular(16),
                                                            topRight: const Radius
                                                                .circular(16))),
                                                    child: Container(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            20.0,
                                                                        right:
                                                                            20.0,
                                                                        top:
                                                                            20.0,
                                                                        bottom:
                                                                            2.0),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        bottom:
                                                                            15,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        "Filter Antre",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "medium",
                                                                            fontSize:
                                                                                19,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.only(
                                                                          bottom:
                                                                              5),
                                                                      child: Text(
                                                                          "Tanggal",
                                                                          style: TextStyle(
                                                                              fontFamily: "regular",
                                                                              fontSize: 15.0,
                                                                              color: Colors.grey)),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          bottom:
                                                                              20),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            controller.textTglMulai,
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .requestFocus(new FocusNode());
                                                                          DatePicker.showDatePicker(
                                                                              context,
                                                                              showTitleActions: true,
                                                                              theme: DatePickerTheme(headerColor: Colors.white, backgroundColor: Colors.white, itemStyle: TextStyle(color: Colors.grey, fontFamily: 'regular', fontWeight: FontWeight.bold, fontSize: 18), cancelStyle: TextStyle(fontFamily: 'regular', color: _colorFromHex("333333"), fontSize: 16), doneStyle: TextStyle(fontFamily: 'regular', color: _colorFromHex("AF0C0C"), fontSize: 16)),
                                                                              onChanged: (date) {}, onConfirm: (date) {
                                                                            controller.textTglMulai.text =
                                                                                convertDateTimeDisplay3(date.toString());
                                                                            controller.setTglMulai(convertDateTimeDisplay(date.toString()));
                                                                          }, currentTime: DateTime.now(), locale: LocaleType.id);
                                                                        },
                                                                        cursorColor:
                                                                            _colorFromHex("9B9B9B"),
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "regular",
                                                                            fontSize:
                                                                                14.0,
                                                                            color:
                                                                                Colors.black),
                                                                        decoration: InputDecoration(
                                                                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                                                            hoverColor: Colors.black,
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderRadius: new BorderRadius.circular(10.0),
                                                                              borderSide: BorderSide(color: Colors.transparent),
                                                                            ),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                                                              borderRadius: new BorderRadius.circular(10.0),
                                                                            ),
                                                                            prefixIcon: const Icon(
                                                                              Icons.calendar_today_rounded,
                                                                              color: Colors.grey,
                                                                            ),
                                                                            hintStyle: TextStyle(fontFamily: "regular", fontSize: 13),
                                                                            fillColor: Colors.grey[200],
                                                                            filled: true,
                                                                            focusColor: Colors.grey,
                                                                            hintText: 'Tanggal'),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              10,
                                                                          bottom:
                                                                              60),
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      child: ElevatedButton(
                                                                          style: ButtonStyle(
                                                                              padding: MaterialStateProperty.all(EdgeInsets.all(13)),
                                                                              foregroundColor: MaterialStateProperty.all<Color>(_colorFromHex("FFFFFFF")),
                                                                              backgroundColor: MaterialStateProperty.all<Color>(_colorFromHex("C90000")),
                                                                              elevation: MaterialStateProperty.resolveWith<double>(
                                                                                // As you said you dont need elevation. I'm returning 0 in both case
                                                                                (Set<MaterialState> states) {
                                                                                  if (states.contains(MaterialState.disabled)) {
                                                                                    return 0;
                                                                                  }
                                                                                  return 0; // Defer to the widget's default.
                                                                                },
                                                                              ),
                                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ))),
                                                                          child: Text(
                                                                            'Filter',
                                                                            style: TextStyle(
                                                                                fontFamily: 'bold',
                                                                                color: Colors.white,
                                                                                fontSize: 15),
                                                                          ),
                                                                          onPressed: () {
                                                                            controller.setTglMulaiDepan(controller.tglmulai.value);
                                                                            // if (controller.poli.value == '' || controller.textTglMulai.text == '' || controller.textTglSelesai.text == '' || controller.maxantre.value == '' || controller.textJamMulai.text == '' || controller.textJamSelesai.text == '') {
                                                                            //   showTopSnackBar(
                                                                            //     context,
                                                                            //     CustomSnackBar.error(
                                                                            //       message: "Silahkan cek kembali form isian Anda",
                                                                            //     ),
                                                                            //   );
                                                                            // } else {
                                                                            controller.setLoading(true);
                                                                            controller.listJadwalAntreRefresh(
                                                                                1,
                                                                                controller.tglmulaidepan.value,
                                                                                controller.poli_nama.value);
                                                                            //   // showAlertDialog(context);
                                                                            // }
                                                                            Navigator.pop(context);
                                                                          }),
                                                                    ),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 10, right: 10),
                                        // padding: EdgeInsets.only(),
                                        child: Text(
                                          "Filter:",
                                          style: TextStyle(
                                              fontFamily: "regular",
                                              color: Colors.grey),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          color: _colorFromHex("F8F8F8"),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        child: Text(
                                          "${convertDateTimeDisplay3(controller.tglmulaidepan.value)}",
                                          style: TextStyle(
                                              fontFamily: "regular",
                                              color: Colors.grey),
                                        )),
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
                                return ItemAntre(
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

class ItemAntre extends StatelessWidget {
  const ItemAntre({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final SanjiwaniController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (user.read("pasien_nik") == null) {
          var snackBar = SnackBar(
              content: Text('Silahkan login untuk menggunakan layanan ini'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
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
                              margin: EdgeInsets.only(top: 15),
                              width: 75.0,
                              height: 75.0,
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
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "${controller.cList.value[index]['manajemen_nama']}",
                                    style: TextStyle(
                                        fontFamily: "medium", fontSize: 17),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${controller.cList.value[index]['rating']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 16),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          width: 24,
                                          child: Image.asset(
                                              'assets/images/star.png'),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              "${controller.cList.value[index]['jumlah_antre']} Orang",
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
                                  )
                                ],
                              ),
                            ),
                            Container(
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
                                    'Ambil Antre',
                                    style: TextStyle(
                                        fontFamily: 'bold',
                                        color: Colors.white,
                                        fontSize: 17),
                                  ),
                                  onPressed: () {
                                    controller.setLoading(true);
                                    controller
                                        .ambilAntre(controller.cList
                                            .value[index]['jadwal_poli_id'])
                                        .then((res) {
                                      if (res.status == true) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)), //this right here
                                                child: Container(
                                                  height: 330,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 150,
                                                          child: Lottie.asset(
                                                              'assets/animasi/success-antre.json'),
                                                        ),
                                                        Text(
                                                          "Antrean depan Anda: ${res.master['antrian_didepan']}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'regular',
                                                              color:
                                                                  Colors.grey),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                        Text(
                                                          "Nomor Antre Anda:",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'regular',
                                                              color:
                                                                  Colors.grey),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                        Text(
                                                          "${res.master['antrian_nomor']}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'bold',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ButtonStyle(
                                                                      padding: MaterialStateProperty.all(
                                                                          EdgeInsets.all(
                                                                              13)),
                                                                      foregroundColor:
                                                                          MaterialStateProperty.all<Color>(_colorFromHex(
                                                                              "FFFFFFF")),
                                                                      backgroundColor:
                                                                          MaterialStateProperty.all<Color>(_colorFromHex(
                                                                              "FFFFFFF")),
                                                                      elevation:
                                                                          MaterialStateProperty.resolveWith<
                                                                              double>(
                                                                        // As you said you dont need elevation. I'm returning 0 in both case
                                                                        (Set<MaterialState>
                                                                            states) {
                                                                          if (states
                                                                              .contains(MaterialState.disabled)) {
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
                                                                'OK',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'bold',
                                                                    color: _colorFromHex(
                                                                        "C70000"),
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              }),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      } else {
                                        Get.snackbar("Oops!", res.message!,
                                            colorText: Colors.white,
                                            backgroundColor:
                                                Colors.red.shade800);
                                      }
                                    });
                                    Navigator.pop(context);

                                    // if (controller.isSuccess.value) {
                                    //   print('a');
                                    // } else {
                                    //   Get.snackbar(
                                    //       "Oops!", controller.isMessage.value,
                                    //       colorText: Colors.white,
                                    //       backgroundColor: Colors.red.shade800);
                                    // }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
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
                              style:
                                  TextStyle(fontFamily: "medium", fontSize: 16),
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
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 10, right: 10),
                            // padding: EdgeInsets.only(),
                            child: Text(
                              "Pukul:",
                              style: TextStyle(
                                  fontFamily: "regular", color: Colors.grey),
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
                              "${controller.cList.value[index]['jadwal_poli_jam_mulai'].substring(0, 5)} - ${controller.cList.value[index]['jadwal_poli_jam_selesai'].substring(0, 5)}",
                              style: TextStyle(
                                  fontFamily: "regular", color: Colors.grey),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Builder(builder: (context) {
                return Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: _colorFromHex("F8F8F8"),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Antrean",
                              style: TextStyle(
                                  fontFamily: "regular", color: Colors.grey),
                            ),
                          ),
                          Text(
                            "${controller.cList.value[index]['jumlah_antre']}",
                            style: TextStyle(
                                fontFamily: "regular",
                                color: Colors.grey,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
