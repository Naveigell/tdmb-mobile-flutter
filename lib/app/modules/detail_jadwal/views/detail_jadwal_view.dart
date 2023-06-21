import 'package:carousel_slider/carousel_slider.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:intl/intl.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shirne_dialog/shirne_dialog.dart';

import '../controllers/detail_jadwal_controller.dart';

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

class DetailJadwalView extends GetView<DetailJadwalController> {
  final DetailJadwalController _tabx = Get.put(DetailJadwalController());
  final _scrollController = ScrollController();

  Future<void> _pullRefresh() async {
    controller.setLoading(true);
    controller.detailJadwalRefresh(1);
  }

  List<String> customColor = [
    "4EB6CD",
    "4E6ACD",
    "E8BC4A",
    "6DC85E",
    "A0BC51",
    "AF0C0C"
  ];

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

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        iconTheme: IconThemeData(color: _colorFromHex("AF0C0C")),
        title: Text(
          'Detail Jadwal',
          style: TextStyle(
              fontSize: 17.0, fontFamily: 'medium', color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_horiz),
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
                      controller.detailJadwal(controller.pageno.value + 1);
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
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 20, bottom: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 75.0,
                                  height: 75.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage('$urlImg' +
                                            controller.photo.value)),
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
                                        "${controller.nama.value}",
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
                                              "${controller.rating.value}",
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
                                      )
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
                                            "${controller.poli.value}",
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
                                            "${convertDateTimeDisplay3(controller.tanggal.value)}",
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
                                            "Max. Antrean",
                                            style: TextStyle(
                                                fontFamily: 'regular',
                                                color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "${controller.max.value} Orang",
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
                                            "Jml. Antrean",
                                            style: TextStyle(
                                                fontFamily: 'regular',
                                                color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "${controller.jmltotal.value} Orang",
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
                                            "${controller.mulai.value.substring(0, 5)} - ${controller.selesai.value.substring(0, 5)}",
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
                                  margin: EdgeInsets.only(
                                    top: 20,
                                  ),
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
                                                  Colors.grey),
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
                                        'Selesaikan Jadwal',
                                        style: TextStyle(
                                            fontFamily: 'bold',
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                      onPressed: () async {
                                        if (await confirm(
                                          context,
                                          title: Text('Konfirmasi',
                                              style: TextStyle(
                                                  fontFamily: "bold")),
                                          content: Text(
                                            'Yakin menyelesaikan Jadwal ini?',
                                            style: TextStyle(
                                                fontFamily: "regular"),
                                          ),
                                          textOK: Text('Ya',
                                              style: TextStyle(
                                                  fontFamily: "regular",
                                                  color:
                                                      _colorFromHex("AF0C0C"))),
                                          textCancel: Text('Tidak',
                                              style: TextStyle(
                                                  fontFamily: "regular",
                                                  color:
                                                      _colorFromHex("AF0C0C"))),
                                        )) {
                                          controller.setLoading(true);
                                          controller.selesaiJadwal();
                                        }
                                        return print('pressedCancel');

                                        // if (controller.username == '' ||
                                        //     controller.password == '') {
                                        //   showTopSnackBar(
                                        //     context,
                                        //     CustomSnackBar.error(
                                        //       message:
                                        //           "Silahkan cek kembali form isian Anda",
                                        //     ),
                                        //   );
                                        // } else {

                                        //   // showAlertDialog(context);
                                        // }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 80, // constrain height
                          //   child: ListView.builder(
                          //     padding: EdgeInsets.only(left: 10, top: 5),
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.horizontal,
                          //     itemCount: controller.statusList.value.length,
                          //     itemBuilder: (BuildContext context, int ind) {
                          //       return Container(
                          //           margin: EdgeInsets.only(top: 10, right: 7),
                          //           padding: EdgeInsets.all(10),
                          //           decoration: BoxDecoration(
                          //             color: _colorFromHex(customColor[ind]),
                          //             borderRadius: BorderRadius.all(
                          //                 Radius.circular(8.0)),
                          //           ),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 "${controller.statusList.value[ind]['status_nama']}",
                          //                 style: TextStyle(
                          //                     fontFamily: "regular",
                          //                     color: Colors.white),
                          //               ),
                          //               Text(
                          //                 "${controller.statusList.value[ind]['total']} Orang",
                          //                 style: TextStyle(
                          //                     fontFamily: "medium",
                          //                     color: Colors.white),
                          //               ),
                          //             ],
                          //           ));
                          //     },
                          //   ),
                          // ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Obx(
                              () => CarouselSlider(
                                options: CarouselOptions(
                                  height: 80.0,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.6,
                                  initialPage: 1,
                                  enableInfiniteScroll: true,
                                  // autoPlay: true,
                                  // enlargeCenterPage: true,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                ),
                                items: controller.statusList.value.map((i) {
                                  var index =
                                      controller.statusList.value.indexOf(i);

                                  return Container(
                                      width: Get.width,
                                      margin:
                                          EdgeInsets.only(top: 10, right: 7),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color:
                                            _colorFromHex(customColor[index]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${i['status_nama']}",
                                            style: TextStyle(
                                                fontFamily: "regular",
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "${i['total']} Orang",
                                            style: TextStyle(
                                                fontFamily: "medium",
                                                color: Colors.white),
                                          ),
                                        ],
                                      ));
                                }).toList(),
                              ),
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

class ItemJadwal extends StatelessWidget {
  const ItemJadwal({Key? key, required this.controller, required this.index})
      : super(key: key);

  final DetailJadwalController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (convertDateTimeDisplay2(DateTime.now().toString()) ==
            controller.tanggal.value) {
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
                            left: 20.0, right: 20.0, top: 20.0, bottom: 40.0),
                        // color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            ListTile(
                              leading: new Icon(Icons.access_time),
                              title: new Text('Proses Antrean',
                                  style: TextStyle(fontFamily: 'regular')),
                              onTap: () {
                                Navigator.pop(context);
                                controller.isLoading(true);
                                controller.prosesAntre(
                                    controller.cList.value[index]
                                        ['antri_poli_id'],
                                    controller.cList.value[index]
                                        ['jadwal_poli_tanggal'],
                                    "3");
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.check),
                              title: new Text('Selesai Antrean',
                                  style: TextStyle(fontFamily: 'regular')),
                              onTap: () {
                                Navigator.pop(context);
                                controller.isLoading(true);
                                controller.prosesAntre(
                                    controller.cList.value[index]
                                        ['antri_poli_id'],
                                    controller.cList.value[index]
                                        ['jadwal_poli_tanggal'],
                                    "4");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else {
          Get.snackbar("Oops!", "Jadwal belum aktif",
              colorText: Colors.white, backgroundColor: Colors.red.shade800);
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
        width: double.infinity,
        color: (controller.cList.value[index]['antri_poli_aktif'] == "1")
            ? Colors.lightGreen[300]
            : Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Builder(builder: (context) {
                return Container(
                    padding: EdgeInsets.all(7),
                    child: Text(
                      "${controller.cList.value[index]['antri_poli_nomor']}",
                      style: TextStyle(
                          fontFamily: "bold",
                          color: Colors.black,
                          fontSize: 24),
                    ));
              }),
            ),
            Expanded(
              flex: 15,
              child: Builder(builder: (context) {
                return Container(
                    padding: EdgeInsets.all(7),
                    child: Row(
                      children: [
                        Container(
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.cList.value[index]['pasien_nama']}",
                                style: TextStyle(
                                    fontFamily: "medium", fontSize: 16),
                              ),
                              Text(
                                "${controller.cList.value[index]['antri_status']}",
                                style: TextStyle(fontFamily: "regular"),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              }),
            ),
            // (controller.cList.value[index]['antri_poli_aktif'] == "1")
            //     ? Expanded(
            //         child: Container(
            //           color: Colors.green,
            //           height: 59,
            //         ),
            //       )
            //     : Padding(
            //         padding: EdgeInsets.only(right: 20),
            //       )

            // Expanded(
            //   flex: 3,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [

            //       Container(
            //         margin: EdgeInsets.only(top: 5),
            //         child: Row(
            //           children: [
            //             Container(
            //                 margin: EdgeInsets.only(top: 10, right: 10),
            //                 // padding: EdgeInsets.only(),
            //                 child: Text(
            //                   "Pukul:",
            //                   style: TextStyle(
            //                       fontFamily: "regular", color: Colors.grey),
            //                 )),
            //             Container(
            //                 margin: EdgeInsets.only(top: 10),
            //                 padding: EdgeInsets.all(7),
            //                 decoration: BoxDecoration(
            //                   color: _colorFromHex("F8F8F8"),
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(8.0)),
            //                 ),
            //                 child: Text(
            //                   "${controller.cList.value[index]['jadwal_poli_jam_mulai'].substring(0, 5)} - ${controller.cList.value[index]['jadwal_poli_jam_selesai'].substring(0, 5)}",
            //                   style: TextStyle(
            //                       fontFamily: "regular", color: Colors.grey),
            //                 )),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
