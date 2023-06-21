import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:tdmb2/app/modules/jadwal/views/jadwal_view.dart';
import 'package:tdmb2/app/modules/payangan/views/payangan_view.dart';
import 'package:tdmb2/app/modules/puskesmas/views/puskesmas_view.dart';
import 'package:tdmb2/app/modules/sanjiwani/views/sanjiwani_view.dart';

import '../controllers/antre_controller.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class AntreView extends GetView<AntreController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          // leading: IconButton(
          //     icon: Icon(Icons.arrow_back, color: Colors.white),
          //     onPressed: () {}),
          iconTheme: IconThemeData(color: _colorFromHex("AF0C0C")),
          systemOverlayStyle: SystemUiOverlayStyle.dark, // 1

          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFFFFFFFF), Color(0xFFFFFFFF)])),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          ),
          title: Text(
            'Antrean',
            style: TextStyle(
                fontFamily: 'medium', fontSize: 16, color: Colors.black),
          ),
          bottom: PreferredSize(
              child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.black.withOpacity(0.4),
                  indicatorColor: _colorFromHex("AF0C0C"),
                  // indicatorWeight: 3,
                  labelColor: _colorFromHex("AF0C0C"),
                  tabs: [
                    Tab(
                      child: Text('RSUD Sanjiwani',
                          style: TextStyle(
                            fontFamily: 'medium',
                          )),
                    ),
                    Tab(
                      child: Text('Payangan Hospital',
                          style: TextStyle(fontFamily: 'medium')),
                    ),
                    Tab(
                      child: Text('Puskesmas',
                          style: TextStyle(fontFamily: 'medium')),
                    ),
                  ]),
              preferredSize: Size.fromHeight(30.0)),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.more_horiz_rounded),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            SanjiwaniView(),
            PayanganView(),
            PuskesmasView(),
          ],
        ),
      ),
    );
  }
}
