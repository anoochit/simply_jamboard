import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../serverpod.dart';
import '../../../views/views/appbar_view.dart';
import '../../../views/views/avatar_icon_view.dart';
import '../controllers/whiteboard_controller.dart';

class WhiteboardView extends GetView<WhiteboardController> {
  const WhiteboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Jamboard',
        action: AvatarIconView(
          user: sessionManager.signedInUser,
          onTap: () {
            log('goto profile page');
          },
        ),
      ),
      body: Obx(() {
        final data = controller.data;
        return Text('$data');
      }),
    );
  }
}
