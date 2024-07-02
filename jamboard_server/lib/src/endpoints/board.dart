import 'package:jamboard_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class BoardEndpoint extends Endpoint {
  // get whiteboard
  Future<List<Board>> getBoards(Session session) async {
    final userInfo = await session.authenticated;
    return await Board.db.find(
      session,
      where: (p) => p.owner.id.equals(userInfo!.userId),
      orderBy: (p) => p.modifiedAt,
      orderDescending: true,
    );
  }

  // add board
  Future<Board> addBoard(Session session, String title) async {
    final userInfo = await session.authenticated;
    final uuid = Uuid().v4();
    final row = Board(
      title: title,
      content: '{}',
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
    );

    return board;
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
    session.messages.removeListener(
      'channel',
      (message) async {
        sendStreamMessage(session, message);
      },
    );
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
    // }
  }
}
