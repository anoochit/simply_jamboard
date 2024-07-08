import 'dart:convert';
import 'dart:developer';

import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';
import 'package:jamboard_flutter/serverpod.dart';

import '../../../routes/app_pages.dart';

class WhiteboardController extends GetxController {
  RxString data = ''.obs;
  Board? board;

  late StreamingConnectionHandler? connectionHandler;
  DrawingController drawingController = DrawingController();

  RxInt socketStatus = 0.obs;

  late Stream<SerializableModel> boardStream;

  late StreamingConnectionHandler streamingConnectionHandler;

  @override
  void onInit() {
    super.onInit();

    loadBoard();

    openStream();
  }

  @override
  void dispose() {
    super.dispose();
    closeStream();
  }

  // save board
  void saveBoard() {
    log('save board');
    final content = drawingController.getJsonList();
    final jsonContent = jsonEncode(content);
    // log(jsonContent);
    try {
      // save
      drawingController.getImageData().then((image) {
        if (image != null) {
          client.board.saveBoard(board!.id!, jsonContent, image).then((v) {
            log('save board');
          });
        } else {
          log('cannot save board with cover image');
          Get.snackbar('Error', 'cannot save board with cover image');
        }
      });
    } catch (e) {
      log('$e');
      Get.snackbar('Error', '$e');
    }

    try {
      // sent stream message
      log('sent stream message');
      client.board.sendStreamMessage(Board(
          title: board!.title,
          content: jsonContent,
          modifiedAt: DateTime.now(),
          ownerId: board!.ownerId));
    } catch (e) {
      log('$e');
      Get.snackbar('Error', '$e');
    }
  }

  // load board
  loadBoard() async {
    log('load board');
    String? uuid = Get.parameters['id'];
    if (uuid != null) {
      board = await client.board.getBoard(uuid);
      if (board == null) {
        Get.snackbar('Error', 'Board not found!');
        Get.offAllNamed(Routes.HOME);
      } else {
        log('found board ${board!.uuid!}');
        try {
          // write
          data.value = board!.content;
          log(data.value);
          drawContent();
        } catch (e) {
          log('$e');
        }
      }
    }
  }

  // open stream
  openStream() async {
    log('open stream');
    client.openStreamingConnection();

    client.addStreamingConnectionStatusListener(() {
      setStreamStatus();
    });

    // stream listen
    try {
      await for (var message in client.board.stream) {
        //
        if (message is Board) {
          log('found board stream message');
        }
      }
    } catch (e) {
      setStreamStatus();
      log('state = $e');
    }
  }

  // set stream status
  setStreamStatus() {
    if (client.streamingConnectionStatus ==
        StreamingConnectionStatus.connecting) {
      socketStatus.value = 1;
    }
    if (client.streamingConnectionStatus ==
        StreamingConnectionStatus.connected) {
      socketStatus.value = 2;
    }
    if (client.streamingConnectionStatus ==
        StreamingConnectionStatus.disconnected) {
      socketStatus.value = 0;
    }
    if (client.streamingConnectionStatus ==
        StreamingConnectionStatus.waitingToRetry) {
      socketStatus.value = 3;
    }
  }

  // close stream
  closeStream() async {
    client.board.resetStream();
    await client.closeStreamingConnection();
  }

  // draw content from json string
  drawContent() {
    // get paint content
    final jsonContent = jsonDecode(data.value);
    // store as paint content
    List<PaintContent> listPaints = [];
    // parse paint content
    for (var paint in jsonContent) {
      if (paint['type'] == "SimpleLine") {
        listPaints.add(SimpleLine.fromJson(paint));
      }

      // if (paint['type'] == "SmoothLine") {
      //   //print('add smooth line');
      //   listPaints.add(SmoothLine.fromJson(paint));
      // }

      // if (paint['type'] == "StraightLine") {
      //   //print('Add paint straight line');
      //   listPaints.add(StraightLine.fromJson(paint));
      // }

      // if (paint['type'] == "Rectangle") {
      //   //print('Add paint rectangle');
      //   listPaints.add(Rectangle.fromJson(paint));
      // }

      // if (paint['type'] == "Circle") {
      //   //print('Add paint circle');
      //   listPaints.add(Circle.fromJson(paint));
      // }

      // if (paint['type'] == "Eraser") {
      //   //print('Add paint eraser');
      //   listPaints.add(Eraser.fromJson(paint));
      // }
    }

    // draw
    log('redraw!');
    drawingController.addContents(listPaints);
  }
}
