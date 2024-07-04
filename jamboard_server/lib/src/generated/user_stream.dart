/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;

abstract class UserStream extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  UserStream._({
    int? id,
    required this.boardId,
    this.board,
    required this.userInfoId,
    this.userInfo,
  }) : super(id);

  factory UserStream({
    int? id,
    required int boardId,
    _i2.Board? board,
    required int userInfoId,
    _i3.UserInfo? userInfo,
  }) = _UserStreamImpl;

  factory UserStream.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserStream(
      id: jsonSerialization['id'] as int?,
      boardId: jsonSerialization['boardId'] as int,
      board: jsonSerialization['board'] == null
          ? null
          : _i2.Board.fromJson(
              (jsonSerialization['board'] as Map<String, dynamic>)),
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i3.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
    );
  }

  static final t = UserStreamTable();

  static const db = UserStreamRepository._();

  int boardId;

  _i2.Board? board;

  int userInfoId;

  _i3.UserInfo? userInfo;

  @override
  _i1.Table get table => t;

  UserStream copyWith({
    int? id,
    int? boardId,
    _i2.Board? board,
    int? userInfoId,
    _i3.UserInfo? userInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'boardId': boardId,
      if (board != null) 'board': board?.toJson(),
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'boardId': boardId,
      if (board != null) 'board': board?.toJsonForProtocol(),
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
    };
  }

  static UserStreamInclude include({
    _i2.BoardInclude? board,
    _i3.UserInfoInclude? userInfo,
  }) {
    return UserStreamInclude._(
      board: board,
      userInfo: userInfo,
    );
  }

  static UserStreamIncludeList includeList({
    _i1.WhereExpressionBuilder<UserStreamTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserStreamTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserStreamTable>? orderByList,
    UserStreamInclude? include,
  }) {
    return UserStreamIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserStream.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserStream.t),
      include: include,
    );
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
    required int userInfoId,
    _i3.UserInfo? userInfo,
  }) : super._(
          id: id,
          boardId: boardId,
          board: board,
          userInfoId: userInfoId,
          userInfo: userInfo,
        );

  @override
  UserStream copyWith({
    Object? id = _Undefined,
    int? boardId,
    Object? board = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
  }) {
    return UserStream(
      id: id is int? ? id : this.id,
      boardId: boardId ?? this.boardId,
      board: board is _i2.Board? ? board : this.board?.copyWith(),
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i3.UserInfo? ? userInfo : this.userInfo?.copyWith(),
    );
  }
}

class UserStreamTable extends _i1.Table {
  UserStreamTable({super.tableRelation}) : super(tableName: 'user_stream') {
    boardId = _i1.ColumnInt(
      'boardId',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final _i1.ColumnInt boardId;

  _i2.BoardTable? _board;

  late final _i1.ColumnInt userInfoId;

  _i3.UserInfoTable? _userInfo;

  _i2.BoardTable get board {
    if (_board != null) return _board!;
    _board = _i1.createRelationTable(
      relationFieldName: 'board',
      field: UserStream.t.boardId,
      foreignField: _i2.Board.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.BoardTable(tableRelation: foreignTableRelation),
    );
    return _board!;
  }

  _i3.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: UserStream.t.userInfoId,
      foreignField: _i3.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        boardId,
        userInfoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'board') {
      return board;
    }
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class UserStreamInclude extends _i1.IncludeObject {
  UserStreamInclude._({
    _i2.BoardInclude? board,
    _i3.UserInfoInclude? userInfo,
  }) {
    _board = board;
    _userInfo = userInfo;
  }

  _i2.BoardInclude? _board;

  _i3.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {
        'board': _board,
        'userInfo': _userInfo,
      };

  @override
  _i1.Table get table => UserStream.t;
}

class UserStreamIncludeList extends _i1.IncludeList {
  UserStreamIncludeList._({
    _i1.WhereExpressionBuilder<UserStreamTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserStream.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => UserStream.t;
}

class UserStreamRepository {
  const UserStreamRepository._();

  final attachRow = const UserStreamAttachRowRepository._();

  Future<List<UserStream>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserStreamTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserStreamTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserStreamTable>? orderByList,
    _i1.Transaction? transaction,
    UserStreamInclude? include,
  }) async {
    return session.db.find<UserStream>(
      where: where?.call(UserStream.t),
      orderBy: orderBy?.call(UserStream.t),
      orderByList: orderByList?.call(UserStream.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UserStream?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserStreamTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserStreamTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserStreamTable>? orderByList,
    _i1.Transaction? transaction,
    UserStreamInclude? include,
  }) async {
    return session.db.findFirstRow<UserStream>(
      where: where?.call(UserStream.t),
      orderBy: orderBy?.call(UserStream.t),
      orderByList: orderByList?.call(UserStream.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UserStream?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserStreamInclude? include,
  }) async {
    return session.db.findById<UserStream>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<UserStream>> insert(
    _i1.Session session,
    List<UserStream> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserStream>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserStream> insertRow(
    _i1.Session session,
    UserStream row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserStream>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserStream>> update(
    _i1.Session session,
    List<UserStream> rows, {
    _i1.ColumnSelections<UserStreamTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserStream>(
      rows,
      columns: columns?.call(UserStream.t),
      transaction: transaction,
    );
  }

  Future<UserStream> updateRow(
    _i1.Session session,
    UserStream row, {
    _i1.ColumnSelections<UserStreamTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserStream>(
      row,
      columns: columns?.call(UserStream.t),
      transaction: transaction,
    );
  }

  Future<List<UserStream>> delete(
    _i1.Session session,
    List<UserStream> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserStream>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserStream> deleteRow(
    _i1.Session session,
    UserStream row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserStream>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserStream>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserStreamTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserStream>(
      where: where(UserStream.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserStreamTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserStream>(
      where: where?.call(UserStream.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserStreamAttachRowRepository {
  const UserStreamAttachRowRepository._();

  Future<void> board(
    _i1.Session session,
    UserStream userStream,
    _i2.Board board,
  ) async {
    if (userStream.id == null) {
      throw ArgumentError.notNull('userStream.id');
    }
    if (board.id == null) {
      throw ArgumentError.notNull('board.id');
    }

    var $userStream = userStream.copyWith(boardId: board.id);
    await session.db.updateRow<UserStream>(
      $userStream,
      columns: [UserStream.t.boardId],
    );
  }

  Future<void> userInfo(
    _i1.Session session,
    UserStream userStream,
    _i3.UserInfo userInfo,
  ) async {
    if (userStream.id == null) {
      throw ArgumentError.notNull('userStream.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $userStream = userStream.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<UserStream>(
      $userStream,
      columns: [UserStream.t.userInfoId],
    );
  }
}
