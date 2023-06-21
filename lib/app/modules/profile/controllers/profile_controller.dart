import 'dart:async';
import 'dart:convert';

import 'package:alert/alert.dart';
import 'package:tdmb2/app/models/response_api.dart';
import 'package:tdmb2/app/models/response_single.dart';
import 'package:tdmb2/app/modules/profile/providers/profile_provider.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/utils/localstorage.dart';
import 'package:tdmb2/app/utils/utils.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  RxBool isLoading = true.obs;
  final user = GetStorage();
  RxString phone = ''.obs;
  RxString fullname = ''.obs;
  RxString address = ''.obs;
  RxString school = ''.obs;

  dynamic profilData = {}.obs;
  RxBool passwordVisible = true.obs;
  RxBool passwordVisible2 = true.obs;

  RxString selectedImagePath = ''.obs;
  RxString selectedImageSize = ''.obs;

  RxString pass = ''.obs;
  RxString pass2 = ''.obs;

  void setLoading(bool e) {
    isLoading.value = e;
  }

  void setFullName(String name) {
    fullname.value = name;
  }

  void setPhone(String e) {
    phone.value = e;
  }

  void setAddress(String name) {
    address.value = name;
  }

  void setSchool(String e) {
    school.value = e;
  }

  void setPasswordVisible() {
    if (passwordVisible.value == true) {
      passwordVisible.value = false;
    } else {
      passwordVisible.value = true;
    }
  }

  void setPasswordVisible2() {
    if (passwordVisible2.value == true) {
      passwordVisible2.value = false;
    } else {
      passwordVisible2.value = true;
    }
  }

  void setPassword(String e) {
    pass.value = e;
  }

  void setPassword2(String e) {
    pass2.value = e;
  }

  Future<void> profil() {
    return ProfileProvider().profil(user.read("user_id")).then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        profilData.value = ResSingle.fromJson(jsonDecode(response.body)).data;
        user.write("user_id", profilData.value['user_id']!);
        user.write("user_name", profilData.value['user_name']!);
        user.write("user_gender", profilData.value['user_gender']!);
        user.write("user_phone", profilData.value['user_phone']!);
        user.write("user_photo", profilData.value['user_photo']!);
        user.write("user_school", profilData.value['user_school']!);
        user.write("user_address", profilData.value['user_address']!);
        isLoading.value = false;
      }
    });
  }

  Future<void> changePassword(String password) {
    return ProfileProvider()
        .changePassword(user.read("user_id"), password)
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        isLoading.value = false;

        if (ResponseApi.fromJson(jsonDecode(response.body)).status == true) {
          Alert(
                  message:
                      ResponseApi.fromJson(jsonDecode(response.body)).message!,
                  shortDuration: true)
              .show();
          Timer(Duration(seconds: 2), () {
            clearSession();

            Get.offAllNamed(Routes.LOGIN);
          });
        } else {
          Alert(
                  message:
                      ResponseApi.fromJson(jsonDecode(response.body)).message!,
                  shortDuration: true)
              .show();
        }
      }
    });
  }

  Future<void> changeProfile(
      String name, String phones, String address2, String school2) {
    return ProfileProvider()
        .changeProfile(user.read("user_id"), name, phones, address2, school2)
        .then((response) {
      if (response.statusCode == 401) {
        clearSession();
      } else {
        profilData.value = ResSingle.fromJson(jsonDecode(response.body)).data;
        user.write("user_id", profilData.value['user_id']!);
        user.write("user_name", profilData.value['user_name']!);
        user.write("user_gender", profilData.value['user_gender']!);
        user.write("user_phone", profilData.value['user_phone']!);
        user.write("user_photo", profilData.value['user_photo']!);
        user.write("user_school", profilData.value['user_school']!);
        user.write("user_address", profilData.value['user_address']!);
        isLoading.value = false;
      }
    });
  }

  void updateImageUpload(String path, String size) {
    selectedImagePath.value = path;
    selectedImageSize.value = size;

    updateImage();
  }

  Future<void> updateImage() async {
    var uri = Uri.parse('$url' + 'update-image');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath(
        'image', selectedImagePath.value,
        contentType: MediaType('image', 'jpeg')));
    request.fields['user_id'] = user.read("user_id");
    var response = await request.send();
    if (response.statusCode == 200) {
      isLoading.value = false;
      Alert(message: "Update image sukses", shortDuration: true).show();
      profil();
    } else {
      isLoading.value = false;
      Alert(message: "Gagal! Update image", shortDuration: true).show();
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  @override
  void onInit() {
    profil();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
