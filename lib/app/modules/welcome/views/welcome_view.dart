import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/routes/app_pages.dart';

import '../controllers/welcome_controller.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class WelcomeView extends GetView<WelcomeController> {
  final obj = Get.put(WelcomeController());
  PageController _pageController = PageController();
  final user = GetStorage();

  void getChangedPageAndMoveBar(int page) {
    controller.changePage(page);
  }

  Widget circleBar(bool isActive) {
    print(isActive);
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> introWidgetsList = <Widget>[
      ItemJudul(),
      ItemPraktek(),
      ItemPerancang(),
      Narasumber1(),
      Narasumber2(),
    ];
    return Scaffold(
        // backgroundColor: _colorFromHex("6F1445"),
        body: Obx(
      () => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: introWidgetsList.length,
            onPageChanged: (int page) {
              getChangedPageAndMoveBar(page);
            },
            controller: _pageController,
            itemBuilder: (context, index) {
              return introWidgetsList[index];
            },
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < introWidgetsList.length; i++)
                      if (i == controller.currentPageValue.value) ...[
                        circleBar(true)
                      ] else
                        circleBar(false),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Visibility(
                  visible: controller.currentPageValue.value ==
                          introWidgetsList.length - 1
                      ? false
                      : true,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: _colorFromHex("FFFFFF"),
                    onPressed: () {
                      getChangedPageAndMoveBar(
                          controller.currentPageValue.value + 1);
                      _pageController
                          .jumpToPage(controller.currentPageValue.value);
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: _colorFromHex("6F1445"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Visibility(
                  visible:
                      controller.currentPageValue.value == 0 ? false : true,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: _colorFromHex("FFFFFF"),
                    onPressed: () {
                      getChangedPageAndMoveBar(
                          controller.currentPageValue.value - 1);
                      _pageController
                          .jumpToPage(controller.currentPageValue.value);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: _colorFromHex("6F1445"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Visibility(
                  visible: controller.currentPageValue.value ==
                          introWidgetsList.length - 1
                      ? true
                      : false,
                  child: FloatingActionButton(
                    backgroundColor: _colorFromHex("6F1445"),
                    onPressed: () {
                      user.write("first_launch", "1");
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(26))),
                    child: Icon(
                      Icons.arrow_forward,
                      color: _colorFromHex("FFFFFF"),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

class ItemJudul extends StatelessWidget {
  const ItemJudul({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _colorFromHex("6F1445"),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    // near the top right
                    radius: 1,
                    colors: <Color>[
                  Color(0xFF6F1445), // yellow sun
                  Color(0xFF6F1445), // blue sky
                ])),
          ),
          SlideInDown(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/awan.png'),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomIn(
                  child: Container(
                    // padding: EdgeInsets.only(bottom: -10),
                    child: Text(
                      'TDMB',
                      style: TextStyle(
                          fontSize: 50,
                          height: 1,
                          fontFamily: 'bold',
                          color: Colors.white),
                    ),
                  ),
                ),
                ZoomIn(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 40, left: 30, right: 30),
                    child: Text(
                      '(Teknik Dasar Mesatua Bali)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'regular',
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          FadeInUpBig(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset('assets/images/ceria3.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemPraktek extends StatelessWidget {
  const ItemPraktek({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _colorFromHex("6F1445"),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    // near the top right
                    radius: 1,
                    colors: <Color>[
                  Color(0xFF6F1445), // yellow sun
                  Color(0xFF6F1445), // blue sky
                ])),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Column(
                children: [
                  FadeInDown(
                    child: Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        'Materi-Materi',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  FadeInDown(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 40, left: 30, right: 30),
                      child: Text(
                        'Teknik Dasar Mesatua Bali',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'regular',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  ZoomIn(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: _colorFromHex("F8F8F8"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              width: double.infinity,
                              height: 100,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
                                        child: Text(
                                          'Definisi \nmesatua Bali',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'bold',
                                              fontSize: 13,
                                              height: 1.1,
                                              color: _colorFromHex("5B1039")),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: _colorFromHex("F8F8F8"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              width: double.infinity,
                              height: 100,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
                                        child: Text(
                                          'Bahasa atau \nvokal',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'bold',
                                              fontSize: 13,
                                              height: 1.1,
                                              color: _colorFromHex("5B1039")),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                        ],
                      ),
                    ),
                  ),
                  ZoomIn(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: _colorFromHex("F8F8F8"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              width: double.infinity,
                              height: 100,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
                                        child: Text(
                                          'Gerak \nTubuh',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'bold',
                                              fontSize: 13,
                                              height: 1.1,
                                              color: _colorFromHex("5B1039")),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Image.asset('assets/images/tubuh.png'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: _colorFromHex("F8F8F8"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              width: double.infinity,
                              height: 100,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
                                        child: Text(
                                          'Materi Ekspresi \natau Penghayatan',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'bold',
                                              fontSize: 13,
                                              height: 1.1,
                                              color: _colorFromHex("5B1039")),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                        ],
                      ),
                    ),
                  ),
                  ZoomIn(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: _colorFromHex("F8F8F8"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              width: double.infinity,
                              height: 100,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
                                        child: Text(
                                          'Penguasaan Materi \natau Keutuhan Cerita',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'bold',
                                              fontSize: 13,
                                              height: 1.1,
                                              color: _colorFromHex("5B1039")),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: _colorFromHex("F8F8F8"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              width: double.infinity,
                              height: 100,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
                                        child: Text(
                                          'Pesan atau \nAmanat',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'bold',
                                              fontSize: 13,
                                              height: 1.1,
                                              color: _colorFromHex("5B1039")),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 5),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Image.asset('assets/images/pesan.png'),
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
                ],
              ),
            ),
          ),
          FadeInUpBig(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset('assets/images/ceria3.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemPerancang extends StatelessWidget {
  const ItemPerancang({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: _colorFromHex("6F1445"),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 60),
              child: Stack(
                children: [
                  FadeInDown(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/bg-top.png'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 70, left: 20, right: 20),
                    child: Column(
                      children: [
                        FadeInDown(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, bottom: 20),
                            child: Text(
                              'Perancang',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        ZoomIn(
                          child: Container(
                              width: 100.0,
                              height: 100.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child:
                                    Image.asset('assets/images/perancang.png'),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Gusti Ayu Erma Yunita Dewi",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tempat, Tanggal Lahir",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Gianyar, 30 April 2000",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jenis Kelamin",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Perempuan",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Alamat",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Br. Tatiapi Kelod, Ds. Pejeng Kawan, Kec. Tampaksiring, Kab. Gianyar",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Agama",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Hindu",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "No. HP",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "081339489750 ",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Riwayat Pendidikan",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "SD",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              ": SD Negeri 2 Pejeng Kawan",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "SMP",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              ": SMP Negeri 3 Tampaksiring",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "SMA",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              ": SMA Negeri 1 Gianyar",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // FadeInUpBig(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Image.asset('assets/images/ceria3.png'),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Narasumber1 extends StatelessWidget {
  const Narasumber1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: _colorFromHex("6F1445"),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 60),
              child: Stack(
                children: [
                  FadeInDown(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/bg-top.png'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 70, left: 20, right: 20),
                    child: Column(
                      children: [
                        FadeInDown(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, bottom: 20),
                            child: Text(
                              'Narasumber 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        ZoomIn(
                          child: Container(
                              width: 100.0,
                              height: 100.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                    'assets/images/narasumber1.png'),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Drs. Made Taro",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tempat, Tanggal Lahir",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Sengkidu, 16 April 1939",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jenis Kelamin",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Laki-Laki",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Alamat",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Jalan Tukad Balian, Gang Wirastya V, no. 8, Suwung Kangin",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Agama",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Hindu",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "No. HP",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "081337440680",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Riwayat Pendidikan",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "SD",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              ": SD Manggis",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "SMP",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              ": SGB (Sekolah Guru B)",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "SMA",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              ": SGA (Sekolah Guru A)",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Perguruan Tinggi",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Fakultas Sastra Universitas Udayana",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pengalaman Bekerja",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "a.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Guru SD Negeri 2 Sesetan dan SD Negeri 4 Sidakarya",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "b.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Asisten purbakala di Bedulu Gianyar",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "c.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Guru SMA Negeri 2 Denpasar",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "d.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Guru di Sanggar Kukuruyuk dan mengisi acara “Plalian” di TVRI",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "e.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Menulis buku cerita gending rare dan permainan trandisional (47 buku)",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "f.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Menulis Koran dan majalah di Bali TV",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "g.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Mendongeng sambil bermain di Bali maupun di Luar Bali bahkan mancanegara",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // FadeInUpBig(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Image.asset('assets/images/ceria3.png'),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Narasumber2 extends StatelessWidget {
  const Narasumber2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: _colorFromHex("6F1445"),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 60),
              child: Stack(
                children: [
                  FadeInDown(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/bg-top.png'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 70, left: 20, right: 20),
                    child: Column(
                      children: [
                        FadeInDown(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, bottom: 20),
                            child: Text(
                              'Narasumber 2',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        ZoomIn(
                          child: Container(
                              width: 100.0,
                              height: 100.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                    'assets/images/narasumber2.png'),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Dr. Drs. I Wayan Sugita, M.Si",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tempat, Tanggal Lahir",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Bukit Batu, 8 Mei 1965",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jenis Kelamin",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Laki-Laki",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Alamat",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Jalan Perum Taman Lembu Sora blok 6 no. 30",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Agama",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Hindu",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "No. HP",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "081237914800",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Riwayat Pendidikan",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "SD",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              ": SD 1 Samplangan",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "SMP",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              ": SMP N 1 Gianyar",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "SMA",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              ": SPG TGA Saraswati Ginyar",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Perguruan Tinggi",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "S1 Fakultas Sastra Universitas Udayana",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "S2 Kajian Budaya UNUD",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "S3 Agama dan Kebudayaan UNHI",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                    ),
                                    textAlign: TextAlign.left,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pengalaman Bekerja",
                                    style: TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "a.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Dosen Universitas Hindu Negeri (UHN)Denpasar",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "b.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Sekjur penerangan Agama Hindu",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "c.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Kejur Bahasa Bali",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "d.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Pembantu wakil dekan 3 Fakultas Dharma Acarya",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "e.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Dekan Fakultas Dharma Acarya",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "f.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Pembina mesatua Bali dan drama gong",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "g.",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        Expanded(
                                            flex: 9,
                                            child: Text(
                                              "Pendiri sanggar SEKDUT Balia",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
