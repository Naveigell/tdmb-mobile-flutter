// import 'dart:convert';
// import 'dart:io';

import 'package:get/get.dart';
import 'package:tdmb2/app/utils/utils.dart';
// import 'package:tdmb2/app/routes/app_pages.dart';
// import 'package:tdmb2/app/utils/utils.dart';

class ObjektifProvider extends GetConnect {
  Future<dynamic> soal() async {
    final form = FormData({});
    final response = await post('$url' + 'get-soal-all', form);
    return response;
  }
  // Future<ResponReview> review(int id, String token) async {
  //   final response = await http.post(
  //       Uri.parse('$url' + 'manajemen/review-manajemen'),
  //       body: jsonEncode({'nakes_id': '$id'}),
  //       headers: {
  //         "Content-Type": "application/json",
  //         'Authorization': 'Bearer $token',
  //       });
  //   print(jsonDecode(response.body));
  //   return ResponReview.fromJson(jsonDecode(response.body));
  // }
}
