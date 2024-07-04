import 'dart:typed_data';

import 'package:jamboard_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class BoardEndpoint extends Endpoint {
  // get whiteboard
  Future<List<Board>> getBoards(Session session) async {
    final userInfo = await session.authenticated;
    return await Board.db.find(
      session,
      where: (p) => p.owner.id.equals(userInfo!.userId),
      orderBy: (p) => p.modifiedAt,
      orderDescending: true,
      include: Board.include(
        owner: UserInfo.include(),
      ),
    );
  }

  // add board
  Future<Board> addBoard(Session session, String title) async {
    final userInfo = await session.authenticated;
    final uuid = Uuid().v4();
    final row = Board(
      title: title,
      content: '[]',
      ownerId: userInfo!.userId,
      uuid: uuid,
      modifiedAt: DateTime.now(),
    );
    return await Board.db.insertRow(session, row);
  }

  // get board data
  Future<Board?> getBoard(Session session, String uuid) async {
    final board = await Board.db.findFirstRow(
      session,
      where: (p) => p.uuid.equals(uuid),
      orderBy: (p) => p.modifiedAt,
      orderDescending: true,
    );

    return board;
  }

  // save board
  Future<void> saveBoard(
      Session session, int id, String content, ByteData cover) async {
    final board = await Board.db.findById(session, id);
    if (board != null) {
      board.content = content;
      board.modifiedAt = DateTime.now();
      board.cover = cover;
      await Board.db.updateRow(session, board);
    }
  }

  // stream opened
  @override
  Future<void> streamOpened(StreamingSession session) async {
    session.log('Stream opened');
    session.messages.addListener(
      'channel',
      (message) async {
        sendStreamMessage(session, message);
      },
    );
  }

  // stream close
  @override
  Future<void> streamClosed(StreamingSession session) async {
    session.log('Stream closed');
  }

  // stream handle message
  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableModel message) async {
    session.log('Handle message');
    session.log('$message');
    session.messages.postMessage(
      'channel',
      message,
    );
  }
}
