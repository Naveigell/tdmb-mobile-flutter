import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  String path = '';
  String text = '';
  ImageDialog({required this.path, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      color: Colors.white,
                      iconSize: 25,
                      splashRadius: 20,
                      onPressed: () => {Navigator.pop(context)},
                    ),
                  ],
                ),
                Image.network(
                  path,
                  height: 200,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'NexaRegular',
                        color: Colors.white),
                  ),
                )
              ],
            ))
          ],
        ));
  }
}
