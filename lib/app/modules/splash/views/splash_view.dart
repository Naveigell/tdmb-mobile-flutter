import 'package:animate_do/animate_do.dart';
import 'package:tdmb2/app/modules/landing/bindings/landing_binding.dart';
import 'package:tdmb2/app/modules/landing/views/landing_view.dart';
import 'package:tdmb2/app/modules/login/bindings/login_binding.dart';
import 'package:tdmb2/app/modules/login/views/login_view.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';

import 'package:get/get.dart';
import "dart:async";

import '../controllers/splash_controller.dart';
import 'package:tdmb2/app/utils/localstorage.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    final obj = Get.put(SplashController());

    return Scaffold(
      body: Stack(
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
          Center(
            child: ZoomIn(
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/tdmb.png'))),
              ),
            ),
          ),
          FadeInUp(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset('assets/images/ceria2.png'),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 7),
                child: Text(
                  'Loading...',
                  style: TextStyle(fontFamily: 'bold', color: Colors.white),
                ),
              ),
              Container(
                  width: 150,
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: LinearProgressIndicator(
                    backgroundColor: _colorFromHex("E9787C"),
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xFFD9181E)),
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  'version 2.4.0',
                  style: TextStyle(
                      fontFamily: 'regular', fontSize: 11, color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
