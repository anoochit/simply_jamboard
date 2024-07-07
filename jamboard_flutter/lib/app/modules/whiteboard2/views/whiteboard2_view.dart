import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whiteboardkit/whiteboard.dart';
import 'package:whiteboardkit/whiteboardkit.dart';

import '../../../routes/app_pages.dart';
import '../controllers/whiteboard2_controller.dart';

class Whiteboard2View extends GetView<Whiteboard2Controller> {
  const Whiteboard2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.offAllNamed(Routes.HOME),
          icon: Icon(Icons.dashboard_outlined),
        ),
        actions: [
          Obx(
            () => Icon(
              Icons.circle,
              color: (controller.socketStatus.value == 2)
                  ? Colors.green
                  : Colors.red,
            ),
          )
        ],
      ),
      body: Whiteboard(
        controller: controller.whiteboardController,
      ),
    );
  }
}
