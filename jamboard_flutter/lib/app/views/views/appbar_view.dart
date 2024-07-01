import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

PreferredSizeWidget appBar(
    {required BuildContext context, required String title, Widget? action}) {
  final width = MediaQuery.sizeOf(context).width;
  return PreferredSize(
    preferredSize: Size(width, 64),
    child: Container(
      width: width,
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
          ),
          TextButton(
            onPressed: () => Get.offAllNamed(Routes.HOME),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Spacer(),
          (action != null) ? action : Container(),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    ),
  );
}
