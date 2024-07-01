/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i3;

abstract class UserStream implements _i1.SerializableModel {
  UserStream._({
    this.id,
    required this.boardId,
    this.board,
    required this.userId,
    this.user,
  });

  factory UserStream({
    int? id,
    required int boardId,
    _i2.Board? board,
    required int userId,
    _i3.UserInfo? user,
  }) = _UserStreamImpl;

  factory UserStream.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserStream(
      id: jsonSerialization['id'] as int?,
      boardId: jsonSerialization['boardId'] as int,
      board: jsonSerialization['board'] == null
          ? null
          : _i2.Board.fromJson(
              (jsonSerialization['board'] as Map<String, dynamic>)),
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i3.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int boardId;

  _i2.Board? board;

  int userId;

  _i3.UserInfo? user;

  UserStream copyWith({
    int? id,
    int? boardId,
    _i2.Board? board,
    int? userId,
    _i3.UserInfo? user,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'boardId': boardId,
      if (board != null) 'board': board?.toJson(),
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserStreamImpl extends UserStream {
  _UserStreamImpl({
    int? id,
    required int boardId,
    _i2.Board? board,
    required int userId,
    _i3.UserInfo? user,
  }) : super._(
          id: id,
          boardId: boardId,
          board: board,
          userId: userId,
          user: user,
        );

  @override
  UserStream copyWith({
    Object? id = _Undefined,
    int? boardId,
    Object? board = _Undefined,
    int? userId,
    Object? user = _Undefined,
  }) {
    return UserStream(
      id: id is int? ? id : this.id,
      boardId: boardId ?? this.boardId,
      board: board is _i2.Board? ? board : this.board?.copyWith(),
      userId: userId ?? this.userId,
      user: user is _i3.UserInfo? ? user : this.user?.copyWith(),
    );
  }
}
