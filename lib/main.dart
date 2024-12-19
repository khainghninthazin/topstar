import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/services/language.dart';
import 'package:top_star/services/push_notification_helper.dart';


import 'appbinding/app_binding.dart';
import 'appbinding/initial_binding.dart';
import 'core/theme/my_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await PushNotificationHelper.initialized();

  await Future.delayed(const Duration(milliseconds: 300));
  await InitailBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sea Standard 2024 jjjjjj',
      initialBinding: AppBinding(),
      theme: myThemeData(context),
      initialRoute: RouteHelper.nav,
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      getPages: RouteHelper.routes,
      translations: LocalString(),
      locale: const Locale('en', 'US'),
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
    );
  }
}
