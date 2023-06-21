import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:tdmb2/app/services/firebase_service.dart';
import 'package:tdmb2/app/widgets/preloader.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../controllers/login_controller.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class LoginView extends GetView<LoginController> {
  final TextEditingController c = TextEditingController();
  String initialCountry = 'ID';
  PhoneNumber number = PhoneNumber(isoCode: 'ID');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorFromHex("FFFFFF"),
      // appBar: AppBar(
      //     systemOverlayStyle: SystemUiOverlayStyle.dark, // 1
      //     centerTitle: true,
      //     elevation: 0,
      //     flexibleSpace: Container(
      //       decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //               begin: Alignment.topCenter,
      //               end: Alignment.bottomCenter,
      //               colors: <Color>[Color(0xFF830000), Color(0xFFC90000)])),
      //     )),
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return Preloader();
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(children: [
                  Container(
                    color: _colorFromHex("6F1445"),
                    padding: EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 277,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/ceria2.png'),
                    ],
                  ),
                ]),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            top: 30, left: 30, right: 30, bottom: 10),
                        child: Text("Masuk",
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 21.0,
                                color: Colors.black)),
                      ),
                      Container(
                        color: Colors.white,
                        padding:
                            EdgeInsets.only(left: 30, right: 30, bottom: 20),
                        child: Text(
                            "Masuk dengan akun Anda yang telah terdaftar.",
                            style: TextStyle(
                                fontFamily: "regular",
                                fontSize: 15.0,
                                color: Colors.grey)),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            top: 20, left: 25, right: 25, bottom: 20),
                        child: TextFormField(
                          onChanged: (value) => controller.setUsername(value),
                          cursorColor: _colorFromHex("6F1445"),
                          style: TextStyle(
                              fontFamily: "regular",
                              fontSize: 13.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              hoverColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0.0),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: Colors.grey,
                              ),
                              hintStyle: TextStyle(
                                  fontFamily: "regular", fontSize: 13),
                              fillColor: Colors.grey[200],
                              filled: true,
                              focusColor: Colors.grey,
                              hintText: 'Username'),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding:
                            EdgeInsets.only(left: 25, right: 25, bottom: 20),
                        child: TextFormField(
                          onChanged: (value) => controller.setPassword(value),
                          cursorColor: _colorFromHex("6F1445"),
                          enableSuggestions: false,
                          autocorrect: false,
                          obscureText: controller.passwordVisible.value,
                          style: TextStyle(
                              fontFamily: "regular",
                              fontSize: 13.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              hoverColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0.0),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    controller.passwordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  controller.setPasswordVisible();
                                },
                              ),
                              hintStyle: TextStyle(
                                  fontFamily: "regular", fontSize: 13),
                              fillColor: Colors.grey[200],
                              filled: true,
                              focusColor: Colors.grey,
                              hintText: 'Password'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 30, right: 30),
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
                                        _colorFromHex("6F1445")),
                                elevation:
                                    MaterialStateProperty.resolveWith<double>(
                                  // As you said you dont need elevation. I'm returning 0 in both case
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.disabled)) {
                                      return 0;
                                    }
                                    return 0; // Defer to the widget's default.
                                  },
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                  fontFamily: 'bold',
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                            onPressed: () {
                              if (controller.username == '' ||
                                  controller.password == '') {
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.error(
                                    message:
                                        "Silahkan cek kembali form isian Anda",
                                  ),
                                );
                              } else {
                                controller.setLoading(true);
                                controller.login(controller.username.value,
                                    controller.password.value);
                                // showAlertDialog(context);
                              }
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 30, left: 30, right: 30, bottom: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Belum memiliki akun, ",
                              style: TextStyle(
                                  fontFamily: 'regular', fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.REGISTER);
                              },
                              child: Text(
                                "Daftar Sekarang!",
                                style: TextStyle(
                                    fontFamily: 'bold',
                                    color: _colorFromHex("6F1445"),
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
