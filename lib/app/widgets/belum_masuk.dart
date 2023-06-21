import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdmb2/app/routes/app_pages.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class BelumMasuk extends StatelessWidget {
  BelumMasuk();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.only(bottom: 10),
          child: Image.asset('assets/images/oops.png'),
        ),
        Container(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: Text(
            'Anda belum masuk, Silahkan klik tombol masuk untuk melanjutkan',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'regular'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 50, right: 50),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(13)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      _colorFromHex("FFFFFFF")),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(_colorFromHex("FFFFFF")),
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
                'Masuk',
                style: TextStyle(
                    fontFamily: 'bold',
                    color: _colorFromHex("C90000"),
                    fontSize: 17),
              ),
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              }),
        ),
      ],
    );
  }
}
