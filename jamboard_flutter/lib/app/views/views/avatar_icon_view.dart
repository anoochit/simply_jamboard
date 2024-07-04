import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serverpod_auth_client/src/protocol/user_info.dart';

class AvatarIconView extends GetView {
  const AvatarIconView({super.key, this.user, this.onTap});

  final UserInfo? user;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: CircleAvatar(
        child: Text(user!.email!.substring(0, 1).toUpperCase()),
      ),
    );
  }
}
