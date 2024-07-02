import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jamboard_flutter/app/routes/app_pages.dart';
import '../../../../serverpod.dart';
import '../../../data/utils/responsive_utils.dart';
import '../../../views/views/appbar_view.dart';
import '../../../views/views/avatar_icon_view.dart';
import '../controllers/home_controller.dart';
import 'board_thumbnail_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Whiteboard',
        action: AvatarIconView(
          user: sessionManager.signedInUser,
          onTap: () {
            log('goto profile page');
          },
        ),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            //
            await Future.delayed(Duration.zero, () {
              controller.getBoards();
            });
          },
          child: GridView(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ResponsiveUtils.gridItem(context),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            children: List.generate(controller.listBoards.length, (index) {
              final board = controller.listBoards[index];
              return BoardThumbnailView(
                board: board,
                onTap: () {
                  Get.toNamed(
                    Routes.WHITEBOARD,
                    parameters: {"id": board.uuid!},
                  );
                },
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // add board
          final board = await controller.addBoard(
            title: '${DateTime.now().microsecondsSinceEpoch}',
          );
          log('board ${board.uuid}');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
