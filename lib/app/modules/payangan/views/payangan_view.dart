import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payangan_controller.dart';

class PayanganView extends GetView<PayanganController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayanganView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PayanganView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
