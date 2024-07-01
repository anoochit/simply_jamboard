import 'package:jamboard_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class UserStreamEndpoint extends Endpoint {
  // get whiteboard
  Future<List<UserStream>> getUserStream(Session session, int boardId) async {
    final userInfo = await session.authenticated;
    return await UserStream.db.find(
      session,
      where: (p) =>
          (p.boardId.equals(boardId) & (p.userId.equals(userInfo!.userId))),
      include: UserStream.include(
        user: UserInfo.include(),
      ),
    );
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    // final authenticationInfo = await session.authenticated;
    // final userId = authenticationInfo?.userId;
    session.log('Stream userstream opened');
    session.messages.addListener(
      'userstream',
      (message) async {
        sendStreamMessage(session, message);
      },
    );
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    // final authenticationInfo = await session.authenticated;
    // final userId = authenticationInfo?.userId;
    session.log('Stream userstream closed');
    session.messages.removeListener(
      'userstream',
      (message) async {
        sendStreamMessage(session, message);
      },
    );
  }

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableModel message) async {
    // if (message is ChatMessage) {
    // final authenticationInfo = await session.authenticated;
    // final userId = authenticationInfo?.userId;
    session.log('Handle userstream message');
    session.log('$message');
    session.messages.postMessage(
      'userstream',
      message,
    );
    // }
  }
}
