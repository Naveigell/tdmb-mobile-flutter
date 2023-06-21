import 'dart:async';
import 'dart:io';

import 'package:alert/alert.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:tdmb2/app/utils/localstorage.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tdmb2/app/widgets/belum_masuk.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';
import 'package:get_storage/get_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/profile_controller.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class ProfileView extends GetView<ProfileController> {
  final obj = Get.put(ProfileController());
  final user = GetStorage();
  final ImagePicker _picker = ImagePicker();

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    _imgFromCamera() async {
      XFile? image =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    }

    _imgFromGallery() async {
      XFile? image = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);

      if (image != null) {
        controller.setLoading(true);
        obj.updateImageUpload(
            image.path,
            ((File(image.path)).lengthSync() / 1024 / 1024).toStringAsFixed(2) +
                " Mb");
      } else {
        Get.snackbar("Warning", "No image selected",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.orange,
            colorText: Colors.white);
      }
    }

    void _showPicker(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('Photo Library',
                            style: TextStyle(fontFamily: 'regular')),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text(
                        'Camera',
                        style: TextStyle(fontFamily: 'regular'),
                      ),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Get.offAllNamed(Routes.LANDING);
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.more_horiz_rounded),
            ),
          ],
          title: Text(
            'Profil',
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
          return Obx(() {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          bottom: 25, left: 25, right: 25, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          controller.selectedImagePath.value == ''
                              ? Container(
                                  width: 95.0,
                                  height: 95.0,
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
                                                '${urlImg}${controller.profilData['user_photo']}'),
                                          )),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 95.0,
                                  height: 95.0,
                                  child: Image.file(
                                      File(controller.selectedImagePath.value)),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  _showPicker(context);
                                },
                                child: Text(
                                  "Ganti Foto",
                                  style: TextStyle(fontFamily: "regular"),
                                ),
                              ),
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
                                      "Nama",
                                      style: TextStyle(
                                          fontFamily: 'regular',
                                          color: Colors.grey),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "${controller.profilData['user_name']}",
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
                                    Builder(builder: (context) {
                                      if (controller
                                              .profilData['user_gender'] ==
                                          '1') {
                                        return Text(
                                          "Laki-laki",
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                          ),
                                          textAlign: TextAlign.left,
                                        );
                                      } else {
                                        return Text(
                                          "Perempuan",
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                          ),
                                          textAlign: TextAlign.left,
                                        );
                                      }
                                    })
                                  ],
                                ))
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
                                      "No. Telp",
                                      style: TextStyle(
                                          fontFamily: ' regular',
                                          color: Colors.grey),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "${controller.profilData['user_phone']}",
                                      style: TextStyle(
                                        fontFamily: 'regular',
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ))
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
                                      "${controller.profilData['user_address']}",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ))
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
                                      "Sekolah",
                                      style: TextStyle(
                                          fontFamily: 'regular',
                                          color: Colors.grey),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "${controller.profilData['user_school']}",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
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
                                            Colors.white),
                                    elevation: MaterialStateProperty
                                        .resolveWith<double>(
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
                                  'Ubah Profil',
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      color: _colorFromHex("6F1445"),
                                      fontSize: 15),
                                ),
                                onPressed: () {
                                  controller.setFullName(
                                      controller.profilData['user_name']);
                                  controller.setPhone(
                                      controller.profilData['user_phone']);
                                  controller.setAddress(
                                      controller.profilData['user_address']);
                                  controller.setSchool(
                                      controller.profilData['user_school']);
                                  showMaterialModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (BuildContext context) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(16),
                                                  topRight:
                                                      const Radius.circular(
                                                          16))),
                                          child: Container(
                                            child: SingleChildScrollView(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 20.0,
                                                    right: 20.0,
                                                    top: 20.0,
                                                    bottom: 2.0),
                                                // color: Colors.white,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Text(
                                                            'Ubah Profil',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'medium',
                                                                color:
                                                                    _colorFromHex(
                                                                        "6F1445"),
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20, bottom: 10),
                                                      child: Text("Nama",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "medium",
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 0, bottom: 20),
                                                      child: TextFormField(
                                                        initialValue: controller
                                                            .fullname.value,
                                                        onChanged: (value) =>
                                                            controller
                                                                .setFullName(
                                                                    value),
                                                        cursorColor:
                                                            _colorFromHex(
                                                                "6F1445"),
                                                        maxLines: null,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "regular",
                                                            fontSize: 13.0,
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(
                                                                        20,
                                                                        10,
                                                                        20,
                                                                        0),
                                                                hoverColor:
                                                                    Colors
                                                                        .black,
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          10.0),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          0.0),
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          10.0),
                                                                ),
                                                                hintStyle: TextStyle(
                                                                    fontFamily:
                                                                        "regular",
                                                                    fontSize:
                                                                        13),
                                                                fillColor:
                                                                    Colors.grey[
                                                                        200],
                                                                filled: true,
                                                                focusColor:
                                                                    Colors.grey,
                                                                hintText:
                                                                    'Nama'),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 0, bottom: 10),
                                                      child: Text("No. Telp",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "medium",
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 0, bottom: 20),
                                                      child: TextFormField(
                                                        initialValue: controller
                                                            .phone.value,
                                                        onChanged: (value) =>
                                                            controller.setPhone(
                                                                value),
                                                        cursorColor:
                                                            _colorFromHex(
                                                                "6F1445"),
                                                        maxLines: null,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "regular",
                                                            fontSize: 13.0,
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(
                                                                        20,
                                                                        10,
                                                                        20,
                                                                        0),
                                                                hoverColor:
                                                                    Colors
                                                                        .black,
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          10.0),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          0.0),
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          10.0),
                                                                ),
                                                                hintStyle: TextStyle(
                                                                    fontFamily:
                                                                        "regular",
                                                                    fontSize:
                                                                        13),
                                                                fillColor:
                                                                    Colors.grey[
                                                                        200],
                                                                filled: true,
                                                                focusColor:
                                                                    Colors.grey,
                                                                hintText:
                                                                    'No. Telp'),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 0, bottom: 10),
                                                      child: Text("Alamat",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "medium",
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 0, bottom: 20),
                                                      child: TextFormField(
                                                        initialValue: controller
                                                            .address.value,
                                                        onChanged: (value) =>
                                                            controller
                                                                .setAddress(
                                                                    value),
                                                        cursorColor:
                                                            _colorFromHex(
                                                                "6F1445"),
                                                        maxLines: null,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "regular",
                                                            fontSize: 13.0,
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(
                                                                        20,
                                                                        10,
                                                                        20,
                                                                        0),
                                                                hoverColor:
                                                                    Colors
                                                                        .black,
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          10.0),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          0.0),
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          10.0),
                                                                ),
                                                                hintStyle: TextStyle(
                                                                    fontFamily:
                                                                        "regular",
                                                                    fontSize:
                                                                        13),
                                                                fillColor:
                                                                    Colors.grey[
                                                                        200],
                                                                filled: true,
                                                                focusColor:
                                                                    Colors.grey,
                                                                hintText:
                                                                    'Alamat'),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 0, bottom: 10),
                                                      child: Text("Sekolah",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "medium",
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 0, bottom: 20),
                                                      child: TextFormField(
                                                        initialValue: controller
                                                            .school.value,
                                                        onChanged: (value) =>
                                                            controller
                                                                .setSchool(
                                                                    value),
                                                        cursorColor:
                                                            _colorFromHex(
                                                                "6F1445"),
                                                        maxLines: null,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "regular",
                                                            fontSize: 13.0,
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(
                                                                        20,
                                                                        10,
                                                                        20,
                                                                        0),
                                                                hoverColor:
                                                                    Colors
                                                                        .black,
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          10.0),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          0.0),
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          10.0),
                                                                ),
                                                                hintStyle: TextStyle(
                                                                    fontFamily:
                                                                        "regular",
                                                                    fontSize:
                                                                        13),
                                                                fillColor:
                                                                    Colors.grey[
                                                                        200],
                                                                filled: true,
                                                                focusColor:
                                                                    Colors.grey,
                                                                hintText:
                                                                    'Sekolah'),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              padding:
                                                                  MaterialStateProperty.all(
                                                                      EdgeInsets.all(
                                                                          13)),
                                                              foregroundColor:
                                                                  MaterialStateProperty.all<Color>(
                                                                      _colorFromHex(
                                                                          "FFFFFFF")),
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<Color>(
                                                                      _colorFromHex(
                                                                          "6F1445")),
                                                              elevation:
                                                                  MaterialStateProperty.resolveWith<
                                                                      double>(
                                                                // As you said you dont need elevation. I'm returning 0 in both case
                                                                (Set<MaterialState>
                                                                    states) {
                                                                  if (states.contains(
                                                                      MaterialState
                                                                          .disabled)) {
                                                                    return 0;
                                                                  }
                                                                  return 0; // Defer to the widget's default.
                                                                },
                                                              ),
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ))),
                                                          child: Text(
                                                            'Ubah Profil',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'medium',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15),
                                                          ),
                                                          onPressed: () {
                                                            if (controller
                                                                        .fullname ==
                                                                    '' ||
                                                                controller
                                                                        .phone ==
                                                                    '') {
                                                              controller
                                                                  .setLoading(
                                                                      false);
                                                              Alert(
                                                                      message:
                                                                          "Gagal, cek form Anda",
                                                                      shortDuration:
                                                                          true)
                                                                  .show();
                                                            } else {
                                                              Get.back();
                                                              controller
                                                                  .setLoading(
                                                                      true);
                                                              controller.changeProfile(
                                                                  controller
                                                                      .fullname
                                                                      .value,
                                                                  controller
                                                                      .phone
                                                                      .value,
                                                                  controller
                                                                      .address
                                                                      .value,
                                                                  controller
                                                                      .school
                                                                      .value);
                                                            }
                                                          }),
                                                    ),
                                                    SizedBox(
                                                      height: 60,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          bottom: 25, left: 25, right: 25, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                                      "Ubah Password",
                                      style: TextStyle(
                                          fontFamily: 'regular',
                                          color: Colors.black,
                                          fontSize: 16),
                                      textAlign: TextAlign.left,
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
                                      "Password Baru",
                                      style: TextStyle(
                                          fontFamily: 'regular',
                                          color: Colors.grey),
                                      textAlign: TextAlign.left,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 10),
                                      child: TextFormField(
                                        onChanged: (value) =>
                                            controller.setPassword(value),
                                        cursorColor: _colorFromHex("6F1445"),
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        obscureText:
                                            controller.passwordVisible.value,
                                        style: TextStyle(
                                            fontFamily: "regular",
                                            fontSize: 13.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 15.0),
                                            hoverColor: Colors.black,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.lock_outline,
                                              color: Colors.grey,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                  controller
                                                          .passwordVisible.value
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                controller.setPasswordVisible();
                                              },
                                            ),
                                            hintStyle: TextStyle(
                                                fontFamily: "regular",
                                                fontSize: 13),
                                            fillColor: Colors.grey[200],
                                            filled: true,
                                            focusColor: Colors.grey,
                                            hintText: 'Password Baru'),
                                      ),
                                    ),
                                  ],
                                ))
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
                                      "Konfirmasi Password Baru",
                                      style: TextStyle(
                                          fontFamily: 'regular',
                                          color: Colors.grey),
                                      textAlign: TextAlign.left,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 10),
                                      child: TextFormField(
                                        onChanged: (value) =>
                                            controller.setPassword2(value),
                                        cursorColor: _colorFromHex("6F1445"),
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        obscureText:
                                            controller.passwordVisible2.value,
                                        style: TextStyle(
                                            fontFamily: "regular",
                                            fontSize: 13.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 15.0),
                                            hoverColor: Colors.black,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.lock_outline,
                                              color: Colors.grey,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                  controller.passwordVisible2
                                                          .value
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                controller
                                                    .setPasswordVisible2();
                                              },
                                            ),
                                            hintStyle: TextStyle(
                                                fontFamily: "regular",
                                                fontSize: 13),
                                            fillColor: Colors.grey[200],
                                            filled: true,
                                            focusColor: Colors.grey,
                                            hintText: 'Password Baru'),
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
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
                                    elevation: MaterialStateProperty
                                        .resolveWith<double>(
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
                                  'Ganti Password',
                                  style: TextStyle(
                                      fontFamily: 'medium',
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                                onPressed: () {
                                  if (controller.pass == '' ||
                                      controller.pass2 == '') {
                                    controller.setLoading(false);
                                    Alert(
                                            message: "Gagal, cek form Anda",
                                            shortDuration: true)
                                        .show();
                                  } else if (controller.pass !=
                                      controller.pass2) {
                                    controller.setLoading(false);
                                    Alert(
                                            message: "Password tidak sesuai",
                                            shortDuration: true)
                                        .show();
                                  } else {
                                    controller.setLoading(true);
                                    controller
                                        .changePassword(controller.pass.value);
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {Get.toNamed(Routes.LIST_PRAKTEK)},
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 10),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 15, left: 20, right: 20, bottom: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 0,
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: Text(
                                      'List Nilai',
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "medium", fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 0,
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: Text(
                                      'List Nilai Praktek Mesatua Bali',
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "regular", fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(13)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  _colorFromHex("FFFFFFF")),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey.shade100),
                              elevation:
                                  MaterialStateProperty.resolveWith<double>(
                                // As you said you dont need elevation. I'm returning 0 in both case
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
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
                            'Log Out',
                            style: TextStyle(
                                fontFamily: 'medium',
                                color: _colorFromHex("C90000"),
                                fontSize: 15),
                          ),
                          onPressed: () async {
                            if (await confirm(
                              context,
                              title: Text('Konfirmasi',
                                  style: TextStyle(fontFamily: "bold")),
                              content: Text(
                                'Yakin keluar dari aplikasi?',
                                style: TextStyle(fontFamily: "regular"),
                              ),
                              textOK: Text('Ya',
                                  style: TextStyle(
                                      fontFamily: "regular",
                                      color: _colorFromHex("AF0C0C"))),
                              textCancel: Text('Tidak',
                                  style: TextStyle(
                                      fontFamily: "regular",
                                      color: _colorFromHex("AF0C0C"))),
                            )) {
                              clearSession();
                              Timer(Duration(seconds: 1), () {
                                Get.offAllNamed(Routes.LOGIN);
                              });
                            }
                            return print('pressedCancel');
                          }),
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            );
          });
        }
      }),
    );
  }
}
