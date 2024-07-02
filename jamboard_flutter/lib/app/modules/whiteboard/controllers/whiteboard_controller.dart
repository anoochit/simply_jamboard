import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
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
      log(data.value);
      // draw
      drawContent();
    } else {
      board = null;
      data.value = '[]';
    }
  }

  // draw content from json string
  drawContent() {
    // get paint content
    final jsonContent = jsonDecode(data.value);
    // store as paint content
    List<PaintContent> listPaints = [];
    // parse paint content
    for (var paint in jsonContent) {
      if (paint['type'] == "SmoothLine") {
        log('add smooth line');
        listPaints.add(SmoothLine.fromJson(paint));
      }

      if (paint['type'] == "SimpleLine") {
        log('Add paint simple line');
        listPaints.add(SimpleLine.fromJson(paint));
      }

      if (paint['type'] == "StraightLine") {
        log('Add paint straight line');
        listPaints.add(StraightLine.fromJson(paint));
      }

      if (paint['type'] == "Rectangle") {
        log('Add paint rectangle');
        listPaints.add(Rectangle.fromJson(paint));
      }

      if (paint['type'] == "Circle") {
        log('Add paint circle');
        listPaints.add(Circle.fromJson(paint));
      }

      if (paint['type'] == "Eraser") {
        log('Add paint eraser');
        listPaints.add(Eraser.fromJson(paint));
      }
    }

    // draw
    drawingController.addContents(listPaints);
  }

  // save draw content
  saveBoard({required String content, ByteData? cover}) async {
    if (board != null) {
      final json = drawingController.getJsonList();
      final content = jsonEncode(json);
      log('save board');
      // get cover
      client.board.saveBoard(board!.id!, content, cover!);
    }
  }

  // connect stream
  streamConnect() {
    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (state) {
        log('[${DateTime.now()}] - Connection state : ${state.status}');
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
    log('on close');
    // save draw

    // stream close
    streamClose();
    super.onClose();
  }
}
