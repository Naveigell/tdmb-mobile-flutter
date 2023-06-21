import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/modules/antre_pasien/views/antre_pasien_view.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tdmb2/app/modules/home/views/home_view.dart';
import 'package:tdmb2/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/landing_controller.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class LandingView extends GetView<LandingController> {
  final user = GetStorage();

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontFamily: "regular",
      fontWeight: FontWeight.w500,
      fontSize: 13);

  final TextStyle selectedLabelStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 13,
      fontFamily: "medium");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light, // 1
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xFF6F1445), Color(0xFF6F1445)])),
              padding: EdgeInsets.only(right: 25, left: 25, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 45.0,
                              height: 45.0,
                              child: Image.asset('assets/images/tdmb.png'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 12),
                        child: user.read('user_id') != null
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.PROFILE);
                                },
                                child: Container(
                                  width: 45,
                                  padding: EdgeInsets.only(bottom: 5),
                                  height: 45,
                                  child: new AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: new Container(
                                      decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          image: new DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            alignment:
                                                FractionalOffset.topCenter,
                                            image: new NetworkImage(
                                                '${urlImg}${user.read('user_photo')}'),
                                          )),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Icon(
                                  Icons.login_rounded,
                                  size: 35,
                                ),
                              ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeView(),
              AntrePasienView(),
            ],
          )),
      // floatingActionButton: Container(
      //   width: 65,
      //   height: 65,
      //   child: FloatingActionButton(
      //     backgroundColor: _colorFromHex("AF0C0C"),
      //     onPressed: () {},
      //     child: Icon(
      //       Icons.qr_code_scanner,
      //       size: 40,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
