import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jamboard_flutter/app/data/utils/responsive_utils.dart';
import 'package:jamboard_flutter/app/modules/home/views/board_thumbnail_view.dart';
import 'package:jamboard_flutter/app/views/views/avatar_icon_view.dart';
import 'package:jamboard_flutter/serverpod.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('White Board'),
        actions: [
          AvatarIconView(
            user: sessionManager.signedInUser,
          ),
        ],
      ),
      body: Obx(
        () => GridView(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveUtils.gridItem(context),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
          children: List.generate(controller.listBoards.length, (index) {
            final board = controller.listBoards[index];
            return BoardThumbnailView(board: board);
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // add board
          final board = await controller.addBoard(
            title: '${DateTime.now().microsecondsSinceEpoch}',
          );
          print('board ${board.uuid}');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
