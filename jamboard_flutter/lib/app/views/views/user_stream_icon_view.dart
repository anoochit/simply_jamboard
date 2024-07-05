import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamboard_flutter/app/views/views/avatar_icon_view.dart';

import '../../modules/whiteboard/controllers/whiteboard_controller.dart';

class UserStreamIconView extends GetView<WhiteboardController> {
  const UserStreamIconView({super.key});
  @override
  Widget build(BuildContext context) {
    final listAvatars = controller.listUserStream;
    return Obx(
      () => Wrap(
        children: List.generate(listAvatars.length, (index) {
          return AvatarIconView(
            user: listAvatars[index].userInfo,
            onTap: null,
          );
        }),
      ),
    );
  }
}
