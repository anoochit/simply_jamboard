import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';
import 'package:jamboard_flutter/app/views/views/avatar_icon_view.dart';

import '../../modules/whiteboard/controllers/whiteboard_controller.dart';

class UserStreamIconView extends GetView<WhiteboardController> {
  const UserStreamIconView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        children: List.generate(
          controller.listUserStream.length,
          (index) {
            UserStream item = controller.listUserStream[index];
            return AvatarIconView(
              user: item.userInfo,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
