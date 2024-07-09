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
      title: "Whiteboard",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    ),
  );
}
