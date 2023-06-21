// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message");
}

Future<void> _handleNotification(Map<dynamic, dynamic> message) async {
  var data = message['data'] ?? message;
  String screen = data['screen'];
  String id = data['id'];

  // if (screen == 'MOHON_DETAIL') {
  //   Get.toNamed(Routes.MOHON_DETAIL, arguments: {'id': '${id}'});
  // } else if (screen == 'KEBERATAN_DETAIL') {
  //   Get.toNamed(Routes.KEBERATAN_DETAIL, arguments: {'id': '${id}'});
  // } else {
  //   Get.toNamed(Routes.HOME, arguments: {'id': '${id}'});
  // }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await Firebase.initializeApp();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //
  // // workaround for onLaunch: When the app is completely closed (not in the background) and opened directly from the push notification
  // FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage message) {
  //   // print('getInitialMessage data: ${message.data}');
  //   _handleNotification(message.data);
  // });
  //
  // // onMessage: When the app is open and it receives a push notification
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print("onMessage data: ${message.data}");
  // });
  //
  // // replacement for onResume: When the app is in the background and opened directly from the push notification.
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   _handleNotification(message.data);
  // });
  //
  // // onMessage: When the app is open and it receives a push notification
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print("onMessage data: ${message.data}");
  // });
  //
  // // replacement for onResume: When the app is in the background and opened directly from the push notification.
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   _handleNotification(message.data);
  // });

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gianyarku AMAN",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
