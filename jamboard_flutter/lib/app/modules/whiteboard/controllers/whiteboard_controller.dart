import 'dart:convert';
import 'dart:developer';

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

  RxList<UserStream> listUserStream = <UserStream>[].obs;

  late int boardId;
  late int userId;

  late Stream<SerializableModel> boardStream;

  @override
  void onInit() {
    super.onInit();
    loadBoard();
    openStream();
  }

  openStream() async {
    client.openStreamingConnection();

    drawingController.realPainter!.addListener(() {
      //
      log('paint');
    });

    try {
      await for (var message in client.board.stream) {
        //
        if (message is Board) {
          log('load board stream message');
          loadBoard();
        }
        //
        getUserStreamList();
      }
    } catch (e) {}
  }

  @override
  void onClose() {
    removeUserStreamToBoard();
    super.onClose();
  }

  // load board data
  Future<void> loadBoard() async {
    final uuid = Get.parameters['id'];
    if (uuid != null) {
      log('load board = $uuid');
      board = await client.board.getBoard(uuid);
      boardId = board!.id!;
      log('board id = ${boardId}');
      userId = sessionManager.signedInUser!.id!;
      log('user id = ${userId}');
      data.value = board!.content;
      //
      addUserStreamToBoard();
      // draw
      drawContent();
    } else {
      board = null;
      data.value = '[]';
    }
  }

  saveBoard() {
    if (board != null) {
      // get json content from current board
      final json = drawingController.getJsonList();
      final content = jsonEncode(json);

      try {
        // get cover
        drawingController.getImageData().then((cover) async {
          // save board
          await client.board.saveBoard(board!.id!, content, cover!);
          log('Save board = ${board!.uuid}');

          client.board.sendStreamMessage(
            Board(
              id: board!.id,
              title: '',
              content: '',
              modifiedAt: DateTime.now(),
              ownerId: sessionManager.signedInUser!.id!,
            ),
          );
        });
      } catch (e) {
        //
        log('$e');
      }
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

      if (paint['type'] == "Triangle") {
        log('Add paint triangle');
        listPaints.add(Triangle.fromJson(paint));
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
    log('redraw!');
    drawingController.addContents(listPaints);
  }

  // get user stream list
  getUserStreamList() async {
    log('find user in board id = $boardId');

    List<UserStream> userStream =
        await client.userStream.getListUserStreamFromBoard(boardId);
    log('Found ${userStream.length} users in board id = $boardId');
    listUserStream.value = userStream;
  }

  addUserStreamToBoard() async {
    log('add user stream');
    await client.userStream.addUserStreamToBoard(boardId, userId);
    await getUserStreamList();
  }

  removeUserStreamToBoard() async {
    log('remove user stream');
    await client.userStream.removeUserStreamFromBoard(boardId, userId);
    await getUserStreamList();
  }
}
