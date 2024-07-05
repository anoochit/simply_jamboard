// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:jamboard_flutter/app/middleware/routeguard.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/whiteboard/bindings/whiteboard_binding.dart';
import '../modules/whiteboard/views/whiteboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [
        RouteGuard(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.WHITEBOARD,
      page: () => const WhiteboardView(),
      binding: WhiteboardBinding(),
      middlewares: [
        RouteGuard(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
