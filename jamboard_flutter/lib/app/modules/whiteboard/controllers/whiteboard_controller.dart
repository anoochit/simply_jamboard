import 'dart:developer';

import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';
import 'package:jamboard_flutter/serverpod.dart';

class WhiteboardController extends GetxController {
  RxString data = ''.obs;
  Board? board;

  late StreamingConnectionHandler? connectionHandler;
  DrawingController drawingController = DrawingController();

  @override
  void onInit() {
    super.onInit();
    // load board data
    loadBoard();
    // stream connect
    streamConnect();
    // stream listen
    streamListen();
  }

  // load board data
  Future<void> loadBoard() async {
    final uuid = Get.parameters['id'];
    if (uuid != null) {
      log('load board = $uuid');
      board = await client.board.getBoard(uuid);
      data.value = board!.content;
    } else {
      board = null;
      data.value = '{}';
    }
  }

  // connect stream
  streamConnect() {
    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (state) {
        log('Connection state : ${state.status}');
      },
    );
    connectionHandler!.connect();
  }

  // listen stream
  streamListen() async {
    await for (var message in client.board.stream) {
      log(message.toString());
      data.value = message.toString();
    }
  }

  // stream close
  streamClose() {
    client.board.resetStream();
    connectionHandler!.close();
  }

  @override
  void onClose() {
    super.onClose();
    streamClose();
  }
}
