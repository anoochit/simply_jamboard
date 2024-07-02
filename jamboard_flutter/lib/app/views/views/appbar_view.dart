import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

PreferredSizeWidget appBar(
    {required BuildContext context, required String title, Widget? action}) {
  final width = MediaQuery.sizeOf(context).width;
  return PreferredSize(
    preferredSize: Size(width, 64),
    child: SizedBox(
      width: width,
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8.0,
          ),
          TextButton.icon(
            onPressed: () => Get.offAllNamed(Routes.HOME),
            icon: const Icon(Icons.dashboard_outlined),
            label: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const Spacer(),
          (action != null) ? action : Container(),
          const SizedBox(
            width: 8.0,
          ),
        ],
      ),
    ),
  );
}
