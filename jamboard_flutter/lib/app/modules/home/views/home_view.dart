import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jamboard_flutter/app/routes/app_pages.dart';
import '../../../data/utils/responsive_utils.dart';
import '../controllers/home_controller.dart';
import '../../../views/views/board_thumbnail_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.offAllNamed(Routes.HOME),
          icon: Icon(Icons.dashboard_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController textEditingController =
                      TextEditingController();
                  return AlertDialog(
                    title: Text('Open board'),
                    content: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(hintText: 'Board uuid'),
                    ),
                    actions: [
                      FilledButton(
                        onPressed: () {
                          if (textEditingController.text.isNotEmpty) {
                            Get.offAllNamed(Routes.WHITEBOARD2,
                                parameters: {"id": textEditingController.text});
                          }
                        },
                        child: Text('Open'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.file_open),
          )
        ],
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
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 3 / 2,
            ),
            children: List.generate(controller.listBoards.length, (index) {
              final board = controller.listBoards[index];
              return BoardThumbnailView(
                board: board,
                onTap: () {
                  Get.toNamed(
                    Routes.WHITEBOARD2,
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
