import 'dart:convert';
import 'dart:developer';

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
    whiteboardController.close();
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
          whiteboardController.streamController.add(
            WhiteboardDraw.fromJson(
              jsonDecode(board!.content),
            ),
          );
        } catch (e) {
          log('cannot load data : $e');
        }
      }
    }
  }

  openBoardStream() {
    try {
      final x = whiteboardController.draw?.toJson();
      log('$x');
    } catch (e) {
      log('$e');
    }

    whiteboardController.onChange().listen((draw) {
      //
      // client.board.sendStreamMessage();
      final x = jsonEncode(whiteboardController.draw?.toJson());
      log('$x');
    });
  }

  openStream() async {
    streamingConnectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (StreamingConnectionHandlerState state) {
        print('socket state = ${state.status}');
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

    try {
      await for (var message in client.board.stream) {
        //
        if (message is Board) {
          print('found board stream message');
        }
      }
    } catch (e) {
      print('$e');
    }
  }
}
