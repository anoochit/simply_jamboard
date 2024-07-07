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

  late StreamingConnectionHandler streamingConnectionHandler;

  @override
  void onInit() {
    super.onInit();
    loadBoard();
    openStream();
  }

  openStream() async {
    streamingConnectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (StreamingConnectionHandlerState state) {
        print('socket state = ${state.status}');
      },
    );

    streamingConnectionHandler.connect();

    try {
      await for (var message in client.board.stream) {
        //
        if (message is Board) {
          print('load board stream message');
          data.value = message.content;
          drawContent();

          // load board
          // loadBoard();

          // load user stream
          // getUserStreamList();
        }
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  void onClose() {
    removeUserStreamToBoard();
    streamingConnectionHandler.close();
    super.onClose();
  }

  // load board data
  Future<void> loadBoard() async {
    final uuid = Get.parameters['id'];
    if (uuid != null) {
      print('load board = $uuid');
      board = await client.board.getBoard(uuid);
      boardId = board!.id!;
      print('board id = $boardId');
      userId = sessionManager.signedInUser!.id!;
      print('user id = $userId');
      data.value = board!.content;
      //
      // addUserStreamToBoard();
      // draw
      drawContent();
    } else {
      board = null;
      data.value = '[]';
    }
  }

  // save board
  saveBoard() {
    if (board != null) {
      // get json content from current board
      final json = drawingController.getJsonList();
      final content = jsonEncode(json);

      try {
        // send message stream
        client.board
            .sendStreamMessage(
          Board(
            id: board!.id,
            uuid: board!.uuid,
            title: board!.title,
            content: content,
            modifiedAt: DateTime.now(),
            ownerId: sessionManager.signedInUser!.id!,
          ),
        )
            .then((c) {
          //save board
          drawingController.getImageData().then((cover) async {
            await client.board.saveBoard(board!.id!, content, cover!).then((_) {
              print('Save board = ${board!.uuid}');
            });
          });
        });
      } catch (e) {
        //
        print('$e');
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
        //print('add smooth line');
        listPaints.add(SmoothLine.fromJson(paint));
      }

      if (paint['type'] == "SimpleLine") {
        //print('Add paint simple line');
        listPaints.add(SimpleLine.fromJson(paint));
      }

      if (paint['type'] == "StraightLine") {
        //print('Add paint straight line');
        listPaints.add(StraightLine.fromJson(paint));
      }

      if (paint['type'] == "Rectangle") {
        //print('Add paint rectangle');
        listPaints.add(Rectangle.fromJson(paint));
      }

      if (paint['type'] == "Circle") {
        //print('Add paint circle');
        listPaints.add(Circle.fromJson(paint));
      }

      if (paint['type'] == "Eraser") {
        //print('Add paint eraser');
        listPaints.add(Eraser.fromJson(paint));
      }
    }

    // draw
    print('redraw!');
    drawingController.addContents(listPaints);
  }

  // get user stream list
  getUserStreamList() async {
    print('find user in board id = $boardId');

    List<UserStream> userStream =
        await client.userStream.getListUserStreamFromBoard(boardId);
    print('Found ${userStream.length} users in board id = $boardId');
    listUserStream.value = userStream;
  }

  addUserStreamToBoard() async {
    print('add user stream');
    await client.userStream.addUserStreamToBoard(boardId, userId);
    await getUserStreamList();
  }

  removeUserStreamToBoard() async {
    print('remove user stream');
    await client.userStream.removeUserStreamFromBoard(boardId, userId);
    await getUserStreamList();
  }
}
