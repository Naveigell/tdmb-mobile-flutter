import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/puskesmas_controller.dart';

class PuskesmasView extends GetView<PuskesmasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PuskesmasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PuskesmasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
