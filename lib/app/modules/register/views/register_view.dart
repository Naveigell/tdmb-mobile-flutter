import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

showAlertDialog(BuildContext context, String title, String desc) {
  // set up the button
  Widget okButton = FlatButton(
    color: Colors.white,
    child: Text("OK",
        style: TextStyle(
            fontFamily: "semibold", fontSize: 14.0, color: Colors.black)),
    onPressed: () {
      Get.toNamed(Routes.LOGIN);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("${title}",
        style: TextStyle(fontFamily: "semibold", fontSize: 16.0)),
    content: Text("${desc}",
        style: TextStyle(
          fontFamily: "regular",
          fontSize: 14.0,
        )),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class RegisterView extends GetView<RegisterController> {
  final obj = Get.put(RegisterController());

  _handleRadioValueChange(value) {
    switch (value) {
      case 1:
        obj.setGender(value);
        break;
      case 2:
        obj.setGender(value);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Daftar',
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
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return Preloader();
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 40, right: 30, left: 30, bottom: 5),
                  child: Text("Pendaftaran",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "medium",
                          fontSize: 25.0,
                          color: Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: Text("Silahkan masukan informasi Anda",
                      style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 15.0,
                          color: Colors.grey)),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
                  child: Text("A. Informasi Umum",
                      style: TextStyle(
                          fontFamily: "medium",
                          fontSize: 14.0,
                          color: _colorFromHex("6F1445"))),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    initialValue: controller.nama.value,
                    onChanged: (value) => controller.setNama(value),
                    cursorColor: _colorFromHex("6F1445"),
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 13.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Nama Lengkap'),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    initialValue: controller.alamat.value,
                    onChanged: (value) => controller.setAlamat(value),
                    cursorColor: _colorFromHex("6F1445"),
                    minLines: 1,
                    maxLines: 3, // allow user to enter 5 line in textfield
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 13.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                        ),
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Alamat Tinggal'),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    initialValue: controller.hp.value,
                    onChanged: (value) => controller.setHp(value),
                    cursorColor: _colorFromHex("6F1445"),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 13.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          color: Colors.grey,
                        ),
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'No. HP'),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    initialValue: controller.hp.value,
                    onChanged: (value) => controller.setSekolah(value),
                    cursorColor: _colorFromHex("6F1445"),
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 13.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.school,
                          color: Colors.grey,
                        ),
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Nama Sekolah'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 25),
                  child: Text("Jenis Kelamin",
                      style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 15.0,
                          color: Colors.grey)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Radio(
                        value: 1,
                        activeColor: _colorFromHex("6F1445"),
                        groupValue: controller.gender.value,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text('Laki-laki',
                          style: new TextStyle(
                            fontFamily: 'regular',
                            fontSize: 15.0,
                          )),
                      new Radio(
                        value: 2,
                        activeColor: _colorFromHex("6F1445"),
                        groupValue: controller.gender.value,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'Perempuan',
                        style: new TextStyle(
                          fontFamily: 'regular',
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, bottom: 0, top: 10),
                  child: Text("B. Informasi Login",
                      style: TextStyle(
                          fontFamily: "medium",
                          fontSize: 14.0,
                          color: _colorFromHex("6F1445"))),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    onChanged: (value) => controller.setUsername(value),
                    cursorColor: _colorFromHex("6F1445"),
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 13.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Username'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
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
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Password'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    onChanged: (value) => controller.setPassword2(value),
                    cursorColor: _colorFromHex("6F1445"),
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: controller.passwordVisible2.value,
                    style: TextStyle(
                        fontFamily: "regular",
                        fontSize: 13.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hoverColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                              // Based on passwordVisible state choose the icon
                              controller.passwordVisible2.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            controller.setPasswordVisible2();
                          },
                        ),
                        hintStyle:
                            TextStyle(fontFamily: "regular", fontSize: 13),
                        fillColor: Colors.grey[200],
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Konfirmasi Password'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(13)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              _colorFromHex("FFFFFFF")),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              _colorFromHex("6F1445")),
                          elevation: MaterialStateProperty.resolveWith<double>(
                            // As you said you dont need elevation. I'm returning 0 in both case
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return 0;
                              }
                              return 0; // Defer to the widget's default.
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                            fontFamily: 'bold',
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      onPressed: () {
                        controller.setLoading(true);

                        if (controller.nama == '' ||
                            controller.username == '' ||
                            controller.alamat == '' ||
                            controller.hp == '' ||
                            controller.sekolah == '' ||
                            controller.pass == '' ||
                            controller.pass2 == '') {
                          controller.setLoading(false);
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(
                              message: "Cek kembali inputan form Anda",
                            ),
                          );
                        } else if (controller.pass != controller.pass2) {
                          controller.setLoading(false);
                          showTopSnackBar(
                              context,
                              CustomSnackBar.error(
                                message:
                                    "Password dengan Konfirmasi Password tidak sama",
                              ));
                        } else {
                          controller.setLoading(true);
                          controller.register(
                            controller.nama.value,
                            controller.alamat.value,
                            controller.hp.value,
                            controller.sekolah.value,
                            controller.gender.value,
                            controller.username.value,
                            controller.pass.value,
                          );

                          // if (controller.title.value != '') {
                          //   showAlertDialog(context, controller.title.value,
                          //       controller.desc.value);
                          // }
                        }
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, bottom: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Telah memiliki akun, ",
                        style: TextStyle(fontFamily: 'regular', fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Text(
                          "Masuk",
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
          );
        }
      }),
    );
  }
}
