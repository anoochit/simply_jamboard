import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';
import '../../../views/views/appbar_view.dart';
import '../controllers/whiteboard_controller.dart';

class WhiteboardView extends GetView<WhiteboardController> {
  const WhiteboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Whiteboard',
        action: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Theme.of(context).colorScheme.primaryContainer),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primaryContainer,
                blurRadius: 2.0,
              ),
            ],
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: DrawingBoard(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            controller: controller.drawingController,
            showDefaultActions: true,
            showDefaultTools: true,
            boardPanEnabled: false,
            boardScaleEnabled: false,
            background: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
            ),
            onPointerUp: (pue) {
              final json = controller.drawingController.getJsonList();
              controller.data.value = jsonEncode(json);
              log(controller.data.value);
              controller.saveDraw(content: controller.data.value);
              // log('${jsonEncode(json.toJson())}');
            },
          ),
        ),
      ),
    );
  }
}
