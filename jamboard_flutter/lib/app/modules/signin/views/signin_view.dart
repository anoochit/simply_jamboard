import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jamboard_flutter/app/routes/app_pages.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../../../serverpod.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SignInWithEmailButton(
          caller: client.modules.auth,
          onSignedIn: () => Get.offAllNamed(Routes.HOME),
        ),
      ),
    );
  }
}
