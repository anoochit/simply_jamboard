import 'dart:developer';

import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';
import 'package:jamboard_flutter/serverpod.dart';

class WhiteboardController extends GetxController {
  RxString data = ''.obs;
  Board? board;

  @override
  void onInit() {
    super.onInit();
    // load board data
    loadBoard();
  }

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

  /*
  late StreamingConnectionHandler? connectionHandler;

  RxString data = ''.obs;

  @override
  void onInit() {
    super.onInit();
    streamConnect();
    streamListen();
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    streamClose();
  }
  */
}
