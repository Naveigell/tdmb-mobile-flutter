// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:chewie/chewie.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import '../controllers/detail_cerita_controller.dart';
import 'package:flutter/cupertino.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

String convertDateTimeDisplay4(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss');
  final DateFormat serverFormater = DateFormat('dd MMMM yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

class DetailCeritaView extends GetView<DetailCeritaController> {
  final user = GetStorage();
  final obj = Get.put(DetailCeritaController());

  final _scrollController = ScrollController();

  Future<void> _pullRefresh() async {
    // controller.setLoader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
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
            // obj.audioPlayer.stop();
          ),
          title: Text(
            '${Get.arguments['cerita_judul']}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
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
        body: RefreshIndicator(
          color: _colorFromHex("6F1445"),
          onRefresh: () => _pullRefresh(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Obx(() {
              if (controller.isLoading.value == true) {
                return Preloader();
              } else {
                return SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: [
                            // Container(
                            //   width: double.infinity,
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     crossAxisAlignment: CrossAxisAlignment.end,
                            //     children: [
                            //       Image.asset(
                            //           'assets/images/${Get.arguments['materi_ornamen']}'),
                            //     ],
                            //   ),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 40),
                                  width: 130.0,
                                  height: 130.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage('$urlImgCerita' +
                                            Get.arguments["cerita_foto"])),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 200, left: 20, right: 20),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      "${Get.arguments["cerita_judul"]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "bold",
                                          fontSize: 20,
                                          color: _colorFromHex("6F1445")),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Html(
                                      data:
                                          """${Get.arguments["cerita_isi"]}""",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              }
            }),
          ),
        ));
  }
}
