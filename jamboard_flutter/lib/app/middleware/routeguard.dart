import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamboard_flutter/app/routes/app_pages.dart';
import 'package:jamboard_flutter/serverpod.dart';

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!sessionManager.isSignedIn) {
      return const RouteSettings(name: Routes.SIGNIN);
    } else {
      return null;
    }
  }
}
