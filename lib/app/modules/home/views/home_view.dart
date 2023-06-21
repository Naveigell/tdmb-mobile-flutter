import 'package:animate_do/animate_do.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/modules/landing/controllers/landing_controller.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:tdmb2/app/widgets/dialog_image.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:mailto/mailto.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class HomeView extends GetView<HomeController> {
  final user = GetStorage();
  final obj = Get.put(HomeController());
  final landing = Get.put(LandingController());

  launchMAIL(String url) async {
    final mailtoLink = Mailto(
      to: ['${url}'],
      subject: 'FlowerBed',
      body: '',
    );
    await launch('${mailtoLink}');
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _pullRefresh() async {
    // controller.getHome();
    // controller.getBerita();
    // controller.getBeritaInstansi();
    // controller.getProfilPemkab();
    // if (user.read("nakes") == '1' && user.read("nakes_posisi") == '1') {
    //   controller.jadwalHariIni();
    //   controller.slider();
    // } else {
    //   controller.slider();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          color: _colorFromHex("5B1039"),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FadeInDown(
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: _colorFromHex("FFFFFF"),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                    child: Image.asset(
                                        'assets/images/bg-home.png')),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FadeIn(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              bottom: 5, left: 25, right: 25, top: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "TDMB",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'bold',
                                    height: 1,
                                    color: _colorFromHex("5B1039"),
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FadeIn(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            bottom: 10,
                            left: 25,
                            right: 25,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Teknik Dasar Mesatua Bali",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'regular',
                                    height: 1,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          bottom: 10,
                          top: 30,
                          left: 25,
                          right: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Daftar Materi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'medium',
                                  height: 1,
                                  color: Colors.grey,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          height: 100,
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MATERI1, arguments: {
                                    'materi': 'Materi 1',
                                    'materi_desc': 'Definisi Mesatua Bali',
                                    'materi_container': 'Materi1',
                                    'materi_ornamen': 'materi1.png',
                                    'materi_suara': 'materi1'
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Definisi \nmesatua Bali',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Materi 1',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/definisi.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MATERI1, arguments: {
                                    'materi': 'Materi 2',
                                    'materi_desc': 'Bahasa atau Vokal',
                                    'materi_container': 'Materi2',
                                    'materi_ornamen': 'materi2.png',
                                    'materi_suara': 'materi2'
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Bahasa atau \nvokal',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Materi 2',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/bahasavocal.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MATERI1, arguments: {
                                    'materi': 'Materi 3',
                                    'materi_desc': 'Gerak Tubuh',
                                    'materi_container': 'Materi3',
                                    'materi_ornamen': 'materi3.png',
                                    'materi_suara': 'materi3'
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Gerak \nTubuh',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Materi 3',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/tubuh.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MATERI1, arguments: {
                                    'materi': 'Materi 4',
                                    'materi_desc':
                                        'Materi Ekspresi atau Penghayatan',
                                    'materi_container': 'Materi4',
                                    'materi_ornamen': 'materi4.png',
                                    'materi_suara': 'materi4'
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Materi Ekspresi \natau Penghayatan',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Materi 4',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/ekspresi.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MATERI1, arguments: {
                                    'materi': 'Materi 5',
                                    'materi_desc':
                                        'Penguasaan Materi atau Keutuhan Cerita',
                                    'materi_container': 'Materi5',
                                    'materi_ornamen': 'materi5.png',
                                    'materi_suara': 'materi5'
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Penguasaan Materi \natau Keutuhan Cerita',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Materi 5',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/keutuhan.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MATERI1, arguments: {
                                    'materi': 'Materi 6',
                                    'materi_desc': 'Pesan atau Amanat',
                                    'materi_container': 'Materi6',
                                    'materi_ornamen': 'materi6.png',
                                    'materi_suara': 'materi6'
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 20),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Pesan atau \nAmanat',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Materi 6',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/pesan.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MATERI1, arguments: {
                                    'materi': 'Materi 7',
                                    'materi_desc': 'Penampilan Mesatua',
                                    'materi_container': 'Materi7',
                                    'materi_ornamen': 'materi3.png',
                                    'materi_suara': 'materi7'
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 20),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Penampilan \nMesatua',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Materi 7',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/tubuh.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          bottom: 10,
                          top: 30,
                          left: 25,
                          right: 25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Cerita, Soal dan Praktek",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'medium',
                                  height: 1,
                                  color: Colors.grey,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          height: 100,
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.CERITA);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Kumpulan Daftar \nSatua Bali',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Cerita',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/cerita.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MULAI);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Soal \nObjektif',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Soal',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/objektif.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offAllNamed(Routes.PRAKTEK);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 20),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: _colorFromHex("F8F8F8"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Soal \nPraktek',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'bold',
                                                  fontSize: 13,
                                                  height: 1.1,
                                                  color:
                                                      _colorFromHex("5B1039")),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              'Soal',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                                'assets/images/tubuh.png'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                      )
                    ],
                  ),
                );
              }
            }),
          ),
        ));
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu(
      {Key? key, required this.nama, required this.photo, required this.click})
      : super(key: key);

  final String photo;
  final String nama;
  final String click;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        Get.toNamed(click);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: _colorFromHex("F8F8F8"),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Image.asset('assets/images/bg-home.png')),
              ],
            ),
          ),
          Container(
            child: Text(
              "${nama}",
              textAlign: TextAlign.left,
              style: TextStyle(fontFamily: 'regular', fontSize: 12),
            ),
          ),
        ],
      ),
    ));
  }
}
