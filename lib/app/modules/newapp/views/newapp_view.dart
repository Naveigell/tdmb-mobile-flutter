import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/newapp_controller.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: false);
  } else {
    throw 'Could not launch $url';
  }
}

class NewappView extends GetView<NewappController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Versi terbaru telah tersedia',
              style: TextStyle(fontFamily: 'regular', fontSize: 18),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(13)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          _colorFromHex("FFFFFFF")),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          _colorFromHex("C90000")),
                      elevation: MaterialStateProperty.resolveWith<double>(
                        // As you said you dont need elevation. I'm returning 0 in both case
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return 0;
                          }
                          return 0; // Defer to the widget's default.
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  child: Text(
                    'Update',
                    style: TextStyle(
                        fontFamily: 'bold', color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    launchURL(
                        "https://play.google.com/store/apps/details?id=com.ayuyunitadewi.tdmb.tdmb3");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
