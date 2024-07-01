import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serverpod_auth_client/src/protocol/user_info.dart';

class AvatarIconView extends GetView {
  const AvatarIconView({super.key, this.user});

  final UserInfo? user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO : goto profile page
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          child: Text(user!.email!.substring(0, 1).toUpperCase()),
        ),
      ),
    );
  }
}
