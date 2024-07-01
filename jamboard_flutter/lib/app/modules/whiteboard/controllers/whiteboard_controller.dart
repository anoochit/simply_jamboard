import 'dart:developer';

import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';

import '../../../../serverpod.dart';

class WhiteboardController extends GetxController {
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
