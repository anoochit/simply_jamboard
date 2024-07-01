import 'package:get/get.dart';

import '../controllers/whiteboard_controller.dart';

class WhiteboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhiteboardController>(
      () => WhiteboardController(),
    );
  }
}
