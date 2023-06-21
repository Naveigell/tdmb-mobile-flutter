import 'package:flutter/material.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class Preloader extends StatelessWidget {
  Preloader();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        child: LinearProgressIndicator(
          backgroundColor: _colorFromHex("F5F5F5"),
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF6F1445)),
        ),
      ),
    );
  }
}
