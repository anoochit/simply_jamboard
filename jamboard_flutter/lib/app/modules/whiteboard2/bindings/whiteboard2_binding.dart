import 'package:get/get.dart';

import '../controllers/whiteboard2_controller.dart';

class Whiteboard2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Whiteboard2Controller>(
      () => Whiteboard2Controller(),
    );
  }
}
