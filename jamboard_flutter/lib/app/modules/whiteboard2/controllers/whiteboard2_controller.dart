import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:jamboard_client/jamboard_client.dart';
import 'package:jamboard_flutter/app/routes/app_pages.dart';
import 'package:whiteboardkit/whiteboardkit.dart';

import '../../../../serverpod.dart';

class Whiteboard2Controller extends GetxController {
  DrawingController whiteboardController = DrawingController(
    toolbox: false,
  );

  RxString data = ''.obs;

  RxInt socketStatus = 0.obs;

  late StreamingConnectionHandler streamingConnectionHandler;

  Board? board;

  @override
  void onInit() {
    super.onInit();

    // load board
    loadBoard();

    // open stream
    openStream();

    // board stream
    openBoardStream();

    // load board data from database
  }

  @override
  void onClose() {
    // whiteboardController.close();
    streamingConnectionHandler.close();
    super.onClose();
  }

  loadBoard() async {
    String? uuid = Get.parameters['id'];
    if (uuid != null) {
      board = await client.board.getBoard(uuid);
      if (board == null) {
        Get.snackbar('Error', 'Board not found!');
        Get.offAllNamed(Routes.HOME);
      } else {
        log('found board ${board!.uuid!}');
        try {
          final content = WhiteboardDraw.fromJson(jsonDecode(board!.content));
          whiteboardController.streamController.add(content);
        } catch (e) {
          log('$e');
        }
      }
    }
  }

  openBoardStream() {
    whiteboardController.onChange().listen(
      (draw) {
        log('paint');
        if (draw != null) {
          // draw json string
          final drawJson = jsonEncode(draw.toJson());

          // save board
          client.board.saveBoard(board!.id!, drawJson, ByteData(0));

          // send stream message
          client.board.sendStreamMessage(
            Board(
                title: board!.title,
                content: drawJson,
                modifiedAt: DateTime.now(),
                ownerId: board!.ownerId),
          );
        }
      },
    );
  }

  openStream() async {
    streamingConnectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (StreamingConnectionHandlerState state) {
        log('socket state = ${state.status}');
        if (state.status == StreamingConnectionStatus.connecting) {
          socketStatus.value = 1;
        }
        if (state.status == StreamingConnectionStatus.connected) {
          socketStatus.value = 2;
        }
        if (state.status == StreamingConnectionStatus.disconnected) {
          socketStatus.value = 0;
        }
      },
    );

    streamingConnectionHandler.connect();

    // stream listen
    try {
      await for (var message in client.board.stream) {
        //
        if (message is Board) {
          log('found board stream message');
        }
      }
    } catch (e) {
      log('$e');
    }
  }
}
