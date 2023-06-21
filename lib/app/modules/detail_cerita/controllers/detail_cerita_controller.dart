// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tdmb2/app/modules/materi1/views/materi1_view.dart';
import 'package:video_player/video_player.dart';

class DetailCeritaController extends GetxController
    with SingleGetTickerProviderMixin {
  //TODO: Implement ReviewController
  RxBool isLoading = true.obs;
  // late final VideoPlayerController _controller;
  final VideoPlayerController cvid = VideoPlayerController.asset(
      "assets/video/${Get.arguments["materi_suara"]}.mp4");
  late ChewieController videosController;

  // AssetsAudioPlayer audioPlayer =
  //     AssetsAudioPlayer(); // this will create a instance object of a class

  late AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)
  RxBool isAnimated = true.obs;
  RxBool showPlay = false.obs;
  RxBool shopPause = true.obs;

  void setLoader() {
    isLoading.value = true;
  }

  @override
  void onInit() async {
    if (Get.arguments['materi_container'] == "Materi2" ||
        Get.arguments['materi_container'] == "Materi3" ||
        Get.arguments['materi_container'] == "Materi4") {
      // await cvid.initialize();
      // cvid.setLooping(true);
      // update();

      // await cvid.play();

      videosController = ChewieController(
        videoPlayerController: cvid,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        fullScreenByDefault: false,
        looping: true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown
        ],
      );

      // audioPlayer.open(Audio('assets/audio/materi1.mp3'));
      // audioPlayer.stop();
      iconController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000));

      // audioPlayer.open(
      //     Audio('assets/audio/${Get.arguments["materi_suara"]}.mp3'),
      //     autoStart: true,
      //     showNotification: true);
    } else {
      iconController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000));
      // audioPlayer.open(
      //     Audio('assets/audio/${Get.arguments["materi_suara"]}.mp3'),
      //     autoStart: true,
      //     showNotification: true);
    }

    super.onInit();
  }

  void AnimateIcon() {
    isAnimated.value = !isAnimated.value;
    if (isAnimated.value) {
      iconController.reverse();
      // audioPlayer.play();
    } else {
      // iconController.reverse();
      iconController.forward();
      // audioPlayer.pause();
    }
  }

  @override
  void onReady() {
    isLoading.value = false;
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
    cvid.dispose();
  }

  @override
  void onClose() {}
}
