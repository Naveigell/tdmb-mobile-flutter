import 'dart:async';
import 'dart:convert';

import 'package:alert/alert.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdmb2/app/models/response_api.dart';
import 'package:tdmb2/app/modules/praktek/providers/praktek_provider.dart';
import 'package:tdmb2/app/modules/register/providers/register_provider.dart';
import 'package:tdmb2/app/modules/register/register_model.dart';
import 'package:tdmb2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

class MulaiController extends GetxController {
  final user = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
