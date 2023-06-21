// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:chewie/chewie.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import '../controllers/materi1_controller.dart';
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

class Materi1View extends GetView<Materi1Controller> {
  final user = GetStorage();
  final obj = Get.put(Materi1Controller());

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
                  'Yakin keluar dari materi?',
                  style: TextStyle(fontFamily: "regular"),
                ),
                textOK: Text('Ya',
                    style: TextStyle(
                        fontFamily: "regular", color: _colorFromHex("AF0C0C"))),
                textCancel: Text('Tidak',
                    style: TextStyle(
                        fontFamily: "regular", color: _colorFromHex("AF0C0C"))),
              )) {
                obj.audio.pause();
                obj.audio.dispose();
                Navigator.pop(context);
              }
              return print('pressedCancel');
            },
          ),
          title: Text(
            '${Get.arguments['materi']}',
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
                            Container(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                      'assets/images/${Get.arguments['materi_ornamen']}'),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "${Get.arguments["materi"]}",
                                      style: TextStyle(
                                          fontFamily: "bold",
                                          fontSize: 18,
                                          color: _colorFromHex("6F1445")),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "${Get.arguments["materi_desc"]}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "regular",
                                          color: Colors.grey),
                                    ),
                                  ),
                                  Builder(builder: (context) {
                                    if (Get.arguments["materi_container"] !=
                                        "Materi7") {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // InkWell(
                                          //   child: Icon(
                                          //       CupertinoIcons.backward_fill,
                                          //       color: Colors.grey),
                                          //   onTap: () {
                                          //     // obj._audio.seekBy(
                                          //     //     Duration(seconds: -10));
                                          //   },
                                          // ),
                                          GestureDetector(
                                            onTap: () {
                                              obj.AnimateIcon();
                                            },
                                            child: AnimatedIcon(
                                              icon: AnimatedIcons.pause_play,
                                              progress: obj.iconController,
                                              size: 50,
                                              color: _colorFromHex("6F1445"),
                                            ),
                                          ),
                                          // InkWell(
                                          //   child: Icon(
                                          //     CupertinoIcons.forward_fill,
                                          //     color: Colors.grey,
                                          //   ),
                                          //   onTap: () {
                                          //     // obj._audio.seekBy(
                                          //     //     Duration(seconds: 10));
                                          //     // obj.audioPlayer
                                          //     //     .seek(Duration(seconds: 10));
                                          //     // obj.audioPlayer.next();
                                          //   },
                                          // ),
                                        ],
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Builder(builder: (context) {
                                    if (Get.arguments['materi_container'] ==
                                        "Materi1") {
                                      return Materi1();
                                    } else if (Get
                                            .arguments['materi_container'] ==
                                        "Materi2") {
                                      return Materi2();
                                    } else if (Get
                                            .arguments['materi_container'] ==
                                        "Materi3") {
                                      return Materi3();
                                    } else if (Get
                                            .arguments['materi_container'] ==
                                        "Materi4") {
                                      return Materi4();
                                    } else if (Get
                                            .arguments['materi_container'] ==
                                        "Materi5") {
                                      return Materi5();
                                    } else if (Get
                                            .arguments['materi_container'] ==
                                        "Materi6") {
                                      return Materi6();
                                    } else {
                                      return Container();
                                    }
                                  }),
                                  Builder(builder: (context) {
                                    if (Get.arguments['materi_container'] == "Materi2" ||
                                        Get.arguments['materi_container'] ==
                                            "Materi3" ||
                                        Get.arguments['materi_container'] ==
                                            "Materi4" ||
                                        Get.arguments['materi_container'] ==
                                            "Materi7") {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                              height: 200,
                                              child: GestureDetector(
                                                onTap: () {
                                                  obj.audio.pause();
                                                  obj.audio.dispose();
                                                },
                                                child: Chewie(
                                                  controller:
                                                      obj.videosController,
                                                ),
                                              )),
                                          SizedBox(
                                            height: 60,
                                          ),
                                        ],
                                      );
                                    } else {
                                      return SizedBox(
                                        height: 60,
                                      );
                                    }
                                  }),
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

class Materi1 extends StatelessWidget {
  const Materi1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          // Here is the explicit parent TextStyle
          style: new TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontFamily: 'regular',
          ),
          children: <TextSpan>[
            new TextSpan(
                text: 'Mesatua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text:
                    'Bali sama dengan mendongeng Bali, istilah yang digunakan untuk menyebut sebuah aktivitas bercerita yang umumnya dilakukan oleh orang tua sebelum tidur. ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'Satua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text:
                    'Bali termasuk dalam lingkup sastra Bali lisan berbentuk prosa, yang dalam terminology ilmu sastra disebut dengan dongeng. Secara etimologis kata satua menurut bahasa tuturan masyarakat Bali, berarti berbicara atau bercerita. ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'Satua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text:
                    'Bali umumnya berbentuk lisan, namun belakangan demi kelestariannya ditranskripsikan ke dalam teks-teks satua Bali yang banyak disimpan di Gedong Kirtya Singaraja, Bali. Menurut Bagus (1979:13) sastra Bali tradisional kalau dilihat dari bentuk penyajiannya dapat dibagi atas; sastra lisan dan sastra tulisan. Satua Bali dapat juga digolongkan menjadi fable, legenda, dan mitos. Dalam ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'satua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text:
                    'Bali secara tersirat memiliki fungsi bagi masyarakat dan kebudayaan Bali, fungsi tersebut dapat berupa fungsi sosial yang berkaitan dengan konsep-konsep budaya dan agama Hindu yang dituangkan di dalam ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'satua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text: '(cerita).', style: new TextStyle(fontFamily: "regular")),
          ],
        ),
      ),
    );
  }
}

class Materi2 extends StatelessWidget {
  const Materi2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          // Here is the explicit parent TextStyle
          style: new TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontFamily: 'regular',
          ),
          children: <TextSpan>[
            new TextSpan(
                text:
                    'Bahasa atau vokal yang digunakan sangat berpengaruh terhadap kualitas ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'satua ',
                style: new TextStyle(
                    fontFamily: "regular", fontStyle: FontStyle.italic)),
            new TextSpan(
                text:
                    'yang dibawakan. Menurut Hendrikus (1999:14) menyatakan bahwa retorika sebagai kesenian dalam  berbicara yang dipergunakan dalam proses komunikasi antarmanusia. Seni berbicara atau retorika yang berkaitan dengan vokal sangat berbengaruh dalam menarik simpati pendengar. Bahasa juga dapat mengembangkan kemampuan kreativitas melalui kegiatan mendongeng, menceritakan kembali kisah yang telah didengar, berbagi pengalaman, sosiodrama atau mengarang cerita dan puisi (Mulyasa, 2014:116). Penggunaan bahasa dalam ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'mesatua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text:
                    'juga dikemas agar mudah dimengerti oleh pendengar dan memahami isi dari ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'satua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text:
                    'yang dibawakan. Melalui penyampaian berbahasa, ketepatan vokal yang benar, dan artikulasi yang jelas dalam penyampaian ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'mesatua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text:
                    'Bali akan memudahkan pendengar untuk menafsirkan nilai-nilai terkandung di dalamnya. Struktur bahasa yang digunakan dalam ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'satua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text: 'Bali pada umumnya menggunakan bahasa ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'kepara ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text:
                    'atau bahasa yang digunakan dalam kehidupan sehari-hari ketika mengadakan interaksi dengan lawan bicaranya. Namun tetap disesuaikan dengan ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'anggah ungguhing ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text: '(tingkatan-tingkatan) dalam berbahasa Bali seperti ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text:
                    'AMI (alus mider), ASI (alus singgih), ASO (alus sor), dan BK (basa kasar). ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
          ],
        ),
      ),
    );
  }
}

class Materi3 extends StatelessWidget {
  const Materi3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          // Here is the explicit parent TextStyle
          style: new TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontFamily: 'regular',
          ),
          children: <TextSpan>[
            new TextSpan(
                text:
                    'Gerak tubuh juga mendukung penampilan dari pendongeng atau pembawa cerita. Meskipun gerak tubuh merupakan hak pendongeng atau pembawa cerita, namun gerak tubuh tetap berkaitan dengan ekspresi. Oleh karena itu gaya bercerita berkaitan dengan karakter tokoh yang diperankan. \nMengacu pada hasil wawancara dengan tokoh pendongeng Bali, yakni Bapak Drs. Made Taro, mengatakan bahwa: \nKetika bergerak dalam memerankan sesuatu dibutuhkan dorongan inerspirit (bergerak karena dorongan dari dalam diri) jangan sampai gerakan itu dibuat-buat. Penghayatan dan ekspresi akan mempengaruhi gerakan kita, jadi sedikit bergerak sudah mampu mengekpresikan karakter yang dibawakan (wawancara 19 Oktober 2021). ',
                style: new TextStyle(fontFamily: "regular")),
          ],
        ),
      ),
    );
  }
}

class Materi4 extends StatelessWidget {
  const Materi4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          // Here is the explicit parent TextStyle
          style: new TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
          children: <TextSpan>[
            new TextSpan(
                text:
                    'Ekspresi menyangkut masuknya karakter tokoh cerita pada jiwa pendongeng, sehingga apa yang dikatakan oleh pendongeng itu bukan mewakili dirinya, tetapi mewakili tokoh yang diperankan. Ekspresi ini dapat menyangkut bagaimana karakter tokoh yang keras, lembut, lucu, dan lugu.\n ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text:
                    'Mengacu pada hasil wawancara dengan tokoh pendongeng Bali, yakni Bapak Drs. Made Taro, mengatakan bahwa:\n ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'Dalam ', style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text: 'mesatua ',
                style: new TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: "regular")),
            new TextSpan(
                text:
                    'ada tiga unsur utama yang harus dikuasai yaitu wiraga, wirama, dan wirasa, dari ketiga unsur tersebut yang paling penting ialah wirasa atau penghayatan. Penghayatan menjadi point utama ketika menyampaikan suatu cerita. Sehingga dalam penghayatan akan membuat wiraga, wirama dan wirasa menjadi totalitas. Contoh dalam perlombaaan-perlombaan banyak ditemukan anak didik yang hanya tampil seperti menghafal cerita tanpa adanya suatu penghayatan. Jadi alangkah baiknya wirasa atau penghayatan lebih ditekankan dahulu kepada anak didik, dan nantinya secara tidak langsung wiraga, wirama, dan penguasaan materi akan mengalir sesuai dengan cerita (wawancara 19 Oktober 2021).  ',
                style: new TextStyle(fontFamily: "regular")),
          ],
        ),
      ),
    );
  }
}

class Materi5 extends StatelessWidget {
  const Materi5({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          // Here is the explicit parent TextStyle
          style: new TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontFamily: 'regular',
          ),
          children: <TextSpan>[
            new TextSpan(
                text:
                    'Penguasaan materi yang dimaksud adalah bagaimana seorang pendongeng mampu menguasai alur cerita secara utuh. Keutuhan alur ini dapat memudahkan pendengar dalam menyimak makna cerita. Cerita tidak harus dihafalkan, namun dipahami alurnya kemudian diceritakan dengan bahasa sendiri. ',
                style: new TextStyle(fontFamily: "regular")),
          ],
        ),
      ),
    );
  }
}

class Materi6 extends StatelessWidget {
  const Materi6({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          // Here is the explicit parent TextStyle
          style: new TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontFamily: 'regular',
          ),
          children: <TextSpan>[
            new TextSpan(
                text:
                    'Pesan atau amanat dalam drama adalah pesan yang ingin disampaikan pengarang kepada publiknya. Teknik penyampaian pesan tersebut dapat secara langsung maupun tidak langsung. Penulis naskah lakon menciptakan untuk menyuguhkan persoalan kehidupan manusia, baik kehidupan lahiriah maupun kehidupan batiniah, yakni  pikiran (cita), perasaan (rasa), dan kehendak (karsa).\n ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text:
                    'Mengacu pada hasil wawancara dengan Pembina mesatua Bali, yakni Bapak Dr. Drs. I Wayan Sugita, M.Si mengatakan bahwa:\n ',
                style: new TextStyle(fontFamily: "regular")),
            new TextSpan(
                text:
                    'Penyampaian pesan atau amanat dalam sebuah cerita sama halnya dengan tulisan ilmiah, apa yang dipertanyakan didepan itulah yang ditarik dalam kesimpulan yang nantinya akan dijadikan sebuah amanat. Kadang-kadang si penulis naskah atau si pencerita dalam menyampaikan amanat yang terkandung dalam cerita berbeda dengan isi ceritanya. Contohnya ketika si penulis naskah atau si pencerita membahas tentang Tri Hita Karana dalam menyampaikan amanat, tetapi dalam cerita tidak ada membahas tentang Tri Hita Karana. Hal inilah yang harus diperhatikan ketika menyampaikan amanat dari suatu cerita agar tidak ada tumpang tindih. Apalagi kadang-kadang si penulis naskah atau si pencerita memetik inti sari yang umum di masyarakat yang dijadikan pesan atau amanat, padahal hal tersebut tidak ada dibahas dalam cerita. Jadi si penulis atau si pencerita harus benar-benar memahami pesan atau amanat yang terkandung dalam cerita (wawancara 7 November 2021). ',
                style: new TextStyle(fontFamily: "regular")),
          ],
        ),
      ),
    );
  }
}
