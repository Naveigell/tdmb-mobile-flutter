import 'package:alert/alert.dart';
import 'package:animate_do/animate_do.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/routes/app_pages.dart';

import '../controllers/pembahasan_controller.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class PembahasanView extends GetView<PembahasanController> {
  final obj = Get.put(PembahasanController());
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
      height: isActive ? 5 : 3,
      width: isActive ? 5 : 3,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    _handleRadioValueChangeSoal1(value) {
      print(value);
      switch (value) {
        case 1:
          obj.setSoal1(value);
          break;
        case 2:
          obj.setSoal1(value);
          break;
        case 3:
          obj.setSoal1(value);
          break;
        case 4:
          obj.setSoal1(value);
          break;
      }
    }

    _handleRadioValueChangeSoal2(value) {
      // print(value);
      switch (value) {
        case 1:
          obj.setSoal2(value);
          break;
        case 2:
          obj.setSoal2(value);
          break;
        case 3:
          obj.setSoal2(value);
          break;
        case 4:
          obj.setSoal2(value);
          break;
      }
    }

    _handleRadioValueChangeSoal3(value) {
      // print(value);
      switch (value) {
        case 1:
          obj.setSoal3(value);
          break;
        case 2:
          obj.setSoal3(value);
          break;
        case 3:
          obj.setSoal3(value);
          break;
        case 4:
          obj.setSoal3(value);
          break;
      }
    }

    _handleRadioValueChangeSoal4(value) {
      switch (value) {
        case 1:
          obj.setSoal4(value);
          break;
        case 2:
          obj.setSoal4(value);
          break;
        case 3:
          obj.setSoal4(value);
          break;
        case 4:
          obj.setSoal4(value);
          break;
      }
    }

    _handleRadioValueChangeSoal5(value) {
      switch (value) {
        case 1:
          obj.setSoal5(value);
          break;
        case 2:
          obj.setSoal5(value);
          break;
        case 3:
          obj.setSoal5(value);
          break;
        case 4:
          obj.setSoal5(value);
          break;
      }
    }

    _handleRadioValueChangeSoal6(value) {
      print(value);
      switch (value) {
        case 1:
          obj.setSoal6(value);
          break;
        case 2:
          obj.setSoal6(value);
          break;
        case 3:
          obj.setSoal6(value);
          break;
        case 4:
          obj.setSoal6(value);
          break;
      }
    }

    _handleRadioValueChangeSoal7(value) {
      print(value);
      switch (value) {
        case 1:
          obj.setSoal7(value);
          break;
        case 2:
          obj.setSoal7(value);
          break;
        case 3:
          obj.setSoal7(value);
          break;
        case 4:
          obj.setSoal7(value);
          break;
      }
    }

    _handleRadioValueChangeSoal8(value) {
      switch (value) {
        case 1:
          obj.setSoal8(value);
          break;
        case 2:
          obj.setSoal8(value);
          break;
        case 3:
          obj.setSoal8(value);
          break;
        case 4:
          obj.setSoal8(value);
          break;
      }
    }

    _handleRadioValueChangeSoal9(value) {
      switch (value) {
        case 1:
          obj.setSoal9(value);
          break;
        case 2:
          obj.setSoal9(value);
          break;
        case 3:
          obj.setSoal9(value);
          break;
        case 4:
          obj.setSoal9(value);
          break;
      }
    }

    _handleRadioValueChangeSoal10(value) {
      switch (value) {
        case 1:
          obj.setSoal10(value);
          break;
        case 2:
          obj.setSoal10(value);
          break;
        case 3:
          obj.setSoal10(value);
          break;
        case 4:
          obj.setSoal10(value);
          break;
      }
    }

    _handleRadioValueChangeSoal11(value) {
      switch (value) {
        case 1:
          obj.setSoal11(value);
          break;
        case 2:
          obj.setSoal11(value);
          break;
        case 3:
          obj.setSoal11(value);
          break;
        case 4:
          obj.setSoal11(value);
          break;
      }
    }

    _handleRadioValueChangeSoal12(value) {
      switch (value) {
        case 1:
          obj.setSoal12(value);
          break;
        case 2:
          obj.setSoal12(value);
          break;
        case 3:
          obj.setSoal12(value);
          break;
        case 4:
          obj.setSoal12(value);
          break;
      }
    }

    _handleRadioValueChangeSoal13(value) {
      switch (value) {
        case 1:
          obj.setSoal13(value);
          break;
        case 2:
          obj.setSoal13(value);
          break;
        case 3:
          obj.setSoal13(value);
          break;
        case 4:
          obj.setSoal13(value);
          break;
      }
    }

    _handleRadioValueChangeSoal14(value) {
      switch (value) {
        case 1:
          obj.setSoal14(value);
          break;
        case 2:
          obj.setSoal14(value);
          break;
        case 3:
          obj.setSoal14(value);
          break;
        case 4:
          obj.setSoal14(value);
          break;
      }
    }

    _handleRadioValueChangeSoal15(value) {
      switch (value) {
        case 1:
          obj.setSoal15(value);
          break;
        case 2:
          obj.setSoal15(value);
          break;
        case 3:
          obj.setSoal15(value);
          break;
        case 4:
          obj.setSoal15(value);
          break;
      }
    }

    _handleRadioValueChangeSoal16(value) {
      switch (value) {
        case 1:
          obj.setSoal16(value);
          break;
        case 2:
          obj.setSoal16(value);
          break;
        case 3:
          obj.setSoal16(value);
          break;
        case 4:
          obj.setSoal16(value);
          break;
      }
    }

    _handleRadioValueChangeSoal17(value) {
      switch (value) {
        case 1:
          obj.setSoal17(value);
          break;
        case 2:
          obj.setSoal17(value);
          break;
        case 3:
          obj.setSoal17(value);
          break;
        case 4:
          obj.setSoal17(value);
          break;
      }
    }

    _handleRadioValueChangeSoal18(value) {
      switch (value) {
        case 1:
          obj.setSoal18(value);
          break;
        case 2:
          obj.setSoal18(value);
          break;
        case 3:
          obj.setSoal18(value);
          break;
        case 4:
          obj.setSoal18(value);
          break;
      }
    }

    _handleRadioValueChangeSoal19(value) {
      switch (value) {
        case 1:
          obj.setSoal19(value);
          break;
        case 2:
          obj.setSoal19(value);
          break;
        case 3:
          obj.setSoal19(value);
          break;
        case 4:
          obj.setSoal19(value);
          break;
      }
    }

    _handleRadioValueChangeSoal20(value) {
      switch (value) {
        case 1:
          obj.setSoal20(value);
          break;
        case 2:
          obj.setSoal20(value);
          break;
        case 3:
          obj.setSoal20(value);
          break;
        case 4:
          obj.setSoal20(value);
          break;
      }
    }

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () async {
                Get.back();
              },
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.more_horiz_rounded),
              ),
            ],
            title: Text(
              'Pembahasan',
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
        // backgroundColor: _colorFromHex("6F1445"),
        body: Obx(
          () => Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: controller.cList.value.length,
                onPageChanged: (int page) {
                  getChangedPageAndMoveBar(page);
                },
                controller: _pageController,
                itemBuilder: (context, index) {
                  int pos = index + 1;
                  if (pos == 1) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal1.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal1),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal1.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 2) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal2.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal2),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal2.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 3) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal3.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal3),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal3.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 4) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal4.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal4),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal4.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 5) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal5.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal5),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal5.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 6) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal6.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal6),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal6.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 7) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal7.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal7),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal7.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 8) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal8.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal8),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal8.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 9) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal9.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal9),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal9.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 10) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal10.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal10),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal10.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 11) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal11.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal11),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal11.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 12) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal12.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal12),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal12.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 13) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal13.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal13),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal13.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 14) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal14.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal14),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal14.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 15) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal15.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal15),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal15.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 16) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal16.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal16),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal16.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 17) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal17.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal17),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal17.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 18) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal18.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal18),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal18.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 19) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal19.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal19),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal19.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (pos == 20) {
                    return Obx(
                      () => SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${controller.cList.value[index]['soal_isi']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .cList.value[index]['jawaban'].length,
                                itemBuilder: (context, position) {
                                  return Obx(
                                    () => RadioListTile(
                                        activeColor: _colorFromHex("6F1445"),
                                        title: Text(
                                            "${controller.cList.value[index]['jawaban'][position]['jawab_isi']}",
                                            style: new TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 15.0,
                                            )),
                                        groupValue: controller.soal20.value,
                                        value: int.parse(controller
                                                .cList.value[index]['jawaban']
                                            [position]['jawab_index']),
                                        onChanged:
                                            _handleRadioValueChangeSoal20),
                                  );
                                },
                              ),
                              Builder(builder: (context) {
                                if (controller.soal20.value.toString() !=
                                    controller.cList.value[index]
                                        ['soal_jawaban_index']) {
                                  return Text("SALAH",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.red));
                                } else {
                                  return Text("BENAR",
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: 15,
                                          color: Colors.green));
                                }
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Kunci Jawaban",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_jawaban_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Pembahasan",
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 13,
                                      color: Colors.grey)),
                              Text(
                                  "${controller.cList.value[index]['soal_pembahasan']}",
                                  style: TextStyle(
                                      fontFamily: 'regular', fontSize: 15)),
                              SizedBox(
                                height: 105,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              // Visibility(
              //   visible: controller.currentPageValue.value ==
              //           controller.cList.value.length + 1
              //       ? true
              //       : false,
              //   child: FloatingActionButton(
              //     backgroundColor: _colorFromHex("FFFFFF"),
              //     onPressed: () {},
              //     shape: BeveledRectangleBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(26))),
              //     child: Icon(
              //       Icons.arrow_forward,
              //       color: _colorFromHex("FFFFFF"),
              //     ),
              //   ),
              // ),
              // Stack(
              //   alignment: AlignmentDirectional.topStart,
              //   children: <Widget>[
              //     Container(
              //         width: Get.width,
              //         margin: EdgeInsets.only(bottom: 35),
              //         child: Text("Geser untuk menuju halaman selanjutnya")),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Visibility(
                      visible: controller.currentPageValue.value ==
                              controller.cList.value.length - 1
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
                              controller.cList.value.length - 1
                          ? true
                          : false,
                      child: FloatingActionButton(
                        backgroundColor: _colorFromHex("6F1445"),
                        onPressed: () {
                          Get.offAllNamed(Routes.LANDING);
                        },
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
