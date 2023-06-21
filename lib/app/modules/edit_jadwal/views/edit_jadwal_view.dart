import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:tdmb2/app/widgets/preloader.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../controllers/edit_jadwal_controller.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertDateTimeDisplay2(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('dd MMMM yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertDateTimeDisplay3(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd');
  final DateFormat serverFormater = DateFormat('dd MMMM yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertDateTimeDisplay4(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('HH:mm');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

String convertDateTimeDisplay5(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('HH:mm:ss');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

class EditJadwalView extends GetView<EditJadwalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: _colorFromHex("AF0C0C")),
        title: Text(
          'Edit Jadwal',
          style: TextStyle(
              fontSize: 17.0, fontFamily: 'medium', color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return Preloader();
        } else {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 15),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: _colorFromHex("F8F8F8"),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Text(
                        "Note: Anda dapat merubah data jadwal jika tanggal yang Anda pilih tidak ada sebelumnya pada list jadwal Anda.",
                        style: TextStyle(
                            fontFamily: "regular", color: Colors.grey),
                      )),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("Tanggal Mulai",
                        style: TextStyle(
                            fontFamily: "regular",
                            fontSize: 15.0,
                            color: Colors.grey)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.textTglMulai,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            theme: DatePickerTheme(
                                headerColor: Colors.white,
                                backgroundColor: Colors.white,
                                itemStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                cancelStyle: TextStyle(
                                    fontFamily: 'regular',
                                    color: _colorFromHex("333333"),
                                    fontSize: 16),
                                doneStyle: TextStyle(
                                    fontFamily: 'regular',
                                    color: _colorFromHex("AF0C0C"),
                                    fontSize: 16)),
                            onChanged: (date) {}, onConfirm: (date) {
                          controller.textTglMulai.text =
                              convertDateTimeDisplay3(date.toString());
                          controller.setTglMulai(
                              convertDateTimeDisplay(date.toString()));
                        },
                            currentTime:
                                DateTime.parse("${controller.tglmulai.value}"),
                            locale: LocaleType.id);
                      },
                      cursorColor: _colorFromHex("9B9B9B"),
                      style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 14.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          hoverColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.grey,
                          ),
                          hintStyle:
                              TextStyle(fontFamily: "regular", fontSize: 13),
                          fillColor: Colors.grey[200],
                          filled: true,
                          focusColor: Colors.grey,
                          hintText: 'Tanggal Mulai'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("Jam Mulai",
                        style: TextStyle(
                            fontFamily: "regular",
                            fontSize: 15.0,
                            color: Colors.grey)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.textJamMulai,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        DatePicker.showTimePicker(context,
                            showTitleActions: true,
                            showSecondsColumn: false,
                            theme: DatePickerTheme(
                                headerColor: Colors.white,
                                backgroundColor: Colors.white,
                                itemStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                cancelStyle: TextStyle(
                                    fontFamily: 'regular',
                                    color: _colorFromHex("333333"),
                                    fontSize: 16),
                                doneStyle: TextStyle(
                                    fontFamily: 'regular',
                                    color: _colorFromHex("AF0C0C"),
                                    fontSize: 16)), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          controller.textJamMulai.text =
                              convertDateTimeDisplay4(date.toString());
                          controller.setJamMulai(
                              convertDateTimeDisplay5(date.toString()));
                        }, currentTime: DateTime.now());
                      },
                      cursorColor: _colorFromHex("9B9B9B"),
                      style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 14.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          hoverColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.watch,
                            color: Colors.grey,
                          ),
                          hintStyle:
                              TextStyle(fontFamily: "regular", fontSize: 13),
                          fillColor: Colors.grey[200],
                          filled: true,
                          focusColor: Colors.grey,
                          hintText: 'Jam Mulai'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("Jam Selesai",
                        style: TextStyle(
                            fontFamily: "regular",
                            fontSize: 15.0,
                            color: Colors.grey)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.textJamSelesai,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        DatePicker.showTimePicker(context,
                            showTitleActions: true,
                            showSecondsColumn: false,
                            theme: DatePickerTheme(
                                headerColor: Colors.white,
                                backgroundColor: Colors.white,
                                itemStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                cancelStyle: TextStyle(
                                    fontFamily: 'regular',
                                    color: _colorFromHex("333333"),
                                    fontSize: 16),
                                doneStyle: TextStyle(
                                    fontFamily: 'regular',
                                    color: _colorFromHex("AF0C0C"),
                                    fontSize: 16)), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          controller.textJamSelesai.text =
                              convertDateTimeDisplay4(date.toString());
                          controller.setJamSelesai(
                              convertDateTimeDisplay5(date.toString()));
                        }, currentTime: DateTime.now());
                      },
                      cursorColor: _colorFromHex("9B9B9B"),
                      style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 14.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          hoverColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.watch,
                            color: Colors.grey,
                          ),
                          hintStyle:
                              TextStyle(fontFamily: "regular", fontSize: 13),
                          fillColor: Colors.grey[200],
                          filled: true,
                          focusColor: Colors.grey,
                          hintText: 'Jam Selesai'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("Max. Antrean",
                        style: TextStyle(
                            fontFamily: "regular",
                            fontSize: 15.0,
                            color: Colors.grey)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0, bottom: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: controller.maxantre.value,
                      onChanged: (value) => controller.maxantre(value),
                      cursorColor: _colorFromHex("006633"),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      style: TextStyle(
                          fontFamily: "NexaRegular",
                          fontSize: 14.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                          hoverColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          hintStyle:
                              TextStyle(fontFamily: "regular", fontSize: 13),
                          fillColor: Colors.grey[200],
                          filled: true,
                          focusColor: Colors.grey,
                          hintText: 'Max. Antrean'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 60),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(13)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                _colorFromHex("FFFFFFF")),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                _colorFromHex("C90000")),
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
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontFamily: 'bold',
                              color: Colors.white,
                              fontSize: 15),
                        ),
                        onPressed: () {
                          if (controller.textTglMulai.text == '' ||
                              controller.maxantre.value == '' ||
                              controller.textJamMulai.text == '' ||
                              controller.textJamSelesai.text == '') {
                            showTopSnackBar(
                              context,
                              CustomSnackBar.error(
                                message: "Silahkan cek kembali form isian Anda",
                              ),
                            );
                          } else {
                            controller.setLoading(true);
                            controller.editJadwal(
                                controller.tglmulai.value,
                                controller.jammulai.value,
                                controller.jamselesai.value,
                                controller.maxantre.value);
                            // showAlertDialog(context);
                          }
                        }),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
