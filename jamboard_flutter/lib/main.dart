import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jamboard_flutter/serverpod.dart';

import 'app/routes/app_pages.dart';

void main() {
  // init widget
  WidgetsFlutterBinding.ensureInitialized();
  // init serverpod
  initializeServerpodClient();
  // run app
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Jam Board",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.blue,
          backgroundColor: Colors.blue,
        ),
      ),
    ),
  );
}
