import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:intl/intl.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:shirne_dialog/shirne_dialog.dart';

import '../controllers/jadwal_controller.dart';

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

class JadwalView extends GetView<JadwalController> {
  final JadwalController _tabx = Get.put(JadwalController());
  final _scrollController = ScrollController();

  Future<void> _pullRefresh() async {
    controller.setLoading(true);
    controller.setTgl("");
    controller.textTgl.text = "";
    controller.listJadwalRefresh(1, controller.tgl.value);
  }

  Future<void> _filterRefresh() async {
    controller.setLoading(true);
    controller.listJadwalRefresh(1, controller.tgl.value);
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
          onPressed: () => Get.offAllNamed(Routes.LANDING),
        ),
        iconTheme: IconThemeData(color: _colorFromHex("AF0C0C")),
        title: Text(
          'Jadwal',
          style: TextStyle(
              fontSize: 17.0, fontFamily: 'medium', color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.history),
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
                      controller.listJadwal(
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
                          // Container(
                          //   color: Colors.white,
                          //   width: double.infinity,
                          //   padding:
                          //       EdgeInsets.only(left: 25, right: 25, top: 10),
                          //   child: Text("Filter Tanggal",
                          //       style: TextStyle(
                          //           fontFamily: "regular",
                          //           fontSize: 15.0,
                          //           color: Colors.grey)),
                          // ),
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
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.offAllNamed(Routes.TAMBAH_JADWAL);
        },
        child: Icon(Icons.add),
        backgroundColor: _colorFromHex("AF0C0C"),
      ),
    );
  }
}

class ItemJadwal extends StatelessWidget {
  const ItemJadwal({Key? key, required this.controller, required this.index})
      : super(key: key);

  final JadwalController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_JADWAL, arguments: {
          'jadwal_id': '${controller.cList.value[index]['jadwal_poli_id']}',
        });
      },
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: new Icon(Icons.edit),
                      title: new Text('Edit',
                          style: TextStyle(fontFamily: 'regular')),
                      onTap: () {
                        Navigator.pop(context);
                        Get.toNamed(Routes.EDIT_JADWAL, arguments: {
                          'jadwal_id':
                              '${controller.cList.value[index]['jadwal_poli_id']}',
                          'jadwal_poli_tanggal':
                              '${controller.cList.value[index]['jadwal_poli_tanggal']}',
                          'jadwal_poli_max_antrian':
                              '${controller.cList.value[index]['jadwal_poli_max_antrian']}',
                          'jadwal_poli_jam_mulai':
                              '${controller.cList.value[index]['jadwal_poli_jam_mulai']}',
                          'jadwal_poli_jam_selesai':
                              '${controller.cList.value[index]['jadwal_poli_jam_selesai']}',
                        });
                      },
                    ),
                    (controller.cList.value[index]['jumlah_antre'] == 0)
                        ? ListTile(
                            leading: new Icon(Icons.delete),
                            title: new Text('Hapus',
                                style: TextStyle(fontFamily: 'regular')),
                            onTap: () {
                              Navigator.pop(context);
                              MyDialog.confirm(Text('Are you sure to delete?',
                                      style: TextStyle(fontFamily: 'regular')))
                                  .then((v) {
                                if (v ?? false) {
                                  print(index);
                                  controller.setLoading(true);
                                  // updateList();
                                  controller.deleteJadwal(
                                      controller.cList.value[index]
                                          ['jadwal_poli_id'],
                                      index);
                                } else {}
                              });
                            },
                          )
                        : Container()
                  ],
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        width: double.infinity,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${convertDateTimeDisplay3('${controller.cList.value[index]['jadwal_poli_tanggal']}')}",
                    style: TextStyle(fontFamily: "medium", fontSize: 16),
                  ),
                  Text(
                    "${controller.cList.value[index]['poli_nama']}",
                    style: TextStyle(fontFamily: "regular"),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                if (convertDateTimeDisplay2(DateTime.now().toString()) ==
                    controller.cList.value[index]['jadwal_poli_tanggal']) {
                  return Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color(0xFFAF0C0C),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Antrean",
                                style: TextStyle(
                                    fontFamily: "regular", color: Colors.white),
                              ),
                            ),
                            Text(
                              "${controller.cList.value[index]['jumlah_antre']}",
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
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
