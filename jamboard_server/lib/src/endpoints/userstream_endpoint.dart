import 'package:jamboard_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserStreamEndpoint extends Endpoint {
  //

  // add user to user stream
  Future<void> addUserStreamToBoard(
      Session session, int boardId, int userId) async {
    try {
      final row = UserStream(boardId: boardId, userInfoId: userId);
      await UserStream.db.insertRow(session, row);
    } catch (e) {
      session.log('$e');
    }
  }

  // remove user stream from board
  Future<List<UserStream>> removeUserStreamFromBoard(
      Session session, int boardId, int userId) async {
    return await UserStream.db.deleteWhere(
      session,
      where: (p) => p.boardId.equals(boardId) & p.userInfoId.equals(userId),
    );
  }

  // get list user stream from board
  Future<List<UserStream>> getListUserStreamFromBoard(
      Session session, int boardId) async {
    final rows = await UserStream.db.find(
      session,
      where: (p) => p.boardId.equals(boardId),
      include: UserStream.include(
        userInfo: UserInfo.include(),
      ),
    );

    return rows;
  }
}
