/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Board extends _i1.TableRow implements _i1.ProtocolSerialization {
  Board._({
    int? id,
    required this.title,
    this.uuid,
    required this.content,
    required this.modifiedAt,
    required this.ownerId,
    this.owner,
  }) : super(id);

  factory Board({
    int? id,
    required String title,
    String? uuid,
    required String content,
    required DateTime modifiedAt,
    required int ownerId,
    _i2.UserInfo? owner,
  }) = _BoardImpl;

  factory Board.fromJson(Map<String, dynamic> jsonSerialization) {
    return Board(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      uuid: jsonSerialization['uuid'] as String?,
      content: jsonSerialization['content'] as String,
      modifiedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['modifiedAt']),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
    );
  }

  static final t = BoardTable();

  static const db = BoardRepository._();

  String title;

  String? uuid;

  String content;

  DateTime modifiedAt;

  int ownerId;

  _i2.UserInfo? owner;

  @override
  _i1.Table get table => t;

  Board copyWith({
    int? id,
    String? title,
    String? uuid,
    String? content,
    DateTime? modifiedAt,
    int? ownerId,
    _i2.UserInfo? owner,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (uuid != null) 'uuid': uuid,
      'content': content,
      'modifiedAt': modifiedAt.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (uuid != null) 'uuid': uuid,
      'content': content,
      'modifiedAt': modifiedAt.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
    };
  }

  static BoardInclude include({_i2.UserInfoInclude? owner}) {
    return BoardInclude._(owner: owner);
  }

  static BoardIncludeList includeList({
    _i1.WhereExpressionBuilder<BoardTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BoardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BoardTable>? orderByList,
    BoardInclude? include,
  }) {
    return BoardIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Board.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Board.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BoardImpl extends Board {
  _BoardImpl({
    int? id,
    required String title,
    String? uuid,
    required String content,
    required DateTime modifiedAt,
    required int ownerId,
    _i2.UserInfo? owner,
  }) : super._(
          id: id,
          title: title,
          uuid: uuid,
          content: content,
          modifiedAt: modifiedAt,
          ownerId: ownerId,
          owner: owner,
        );

  @override
  Board copyWith({
    Object? id = _Undefined,
    String? title,
    Object? uuid = _Undefined,
    String? content,
    DateTime? modifiedAt,
    int? ownerId,
    Object? owner = _Undefined,
  }) {
    return Board(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      uuid: uuid is String? ? uuid : this.uuid,
      content: content ?? this.content,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserInfo? ? owner : this.owner?.copyWith(),
    );
  }
}

class BoardTable extends _i1.Table {
  BoardTable({super.tableRelation}) : super(tableName: 'board') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    uuid = _i1.ColumnString(
      'uuid',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    modifiedAt = _i1.ColumnDateTime(
      'modifiedAt',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString uuid;

  late final _i1.ColumnString content;

  late final _i1.ColumnDateTime modifiedAt;

  late final _i1.ColumnInt ownerId;

  _i2.UserInfoTable? _owner;

  _i2.UserInfoTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Board.t.ownerId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        uuid,
        content,
        modifiedAt,
        ownerId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class BoardInclude extends _i1.IncludeObject {
  BoardInclude._({_i2.UserInfoInclude? owner}) {
    _owner = owner;
  }

  _i2.UserInfoInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {'owner': _owner};

  @override
  _i1.Table get table => Board.t;
}

class BoardIncludeList extends _i1.IncludeList {
  BoardIncludeList._({
    _i1.WhereExpressionBuilder<BoardTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Board.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Board.t;
}

class BoardRepository {
  const BoardRepository._();

  final attachRow = const BoardAttachRowRepository._();

  Future<List<Board>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BoardTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BoardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BoardTable>? orderByList,
    _i1.Transaction? transaction,
    BoardInclude? include,
  }) async {
    return session.db.find<Board>(
      where: where?.call(Board.t),
      orderBy: orderBy?.call(Board.t),
      orderByList: orderByList?.call(Board.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Board?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BoardTable>? where,
    int? offset,
    _i1.OrderByBuilder<BoardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BoardTable>? orderByList,
    _i1.Transaction? transaction,
    BoardInclude? include,
  }) async {
    return session.db.findFirstRow<Board>(
      where: where?.call(Board.t),
      orderBy: orderBy?.call(Board.t),
      orderByList: orderByList?.call(Board.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Board?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    BoardInclude? include,
  }) async {
    return session.db.findById<Board>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Board>> insert(
    _i1.Session session,
    List<Board> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Board>(
      rows,
      transaction: transaction,
    );
  }

  Future<Board> insertRow(
    _i1.Session session,
    Board row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Board>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Board>> update(
    _i1.Session session,
    List<Board> rows, {
    _i1.ColumnSelections<BoardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Board>(
      rows,
      columns: columns?.call(Board.t),
      transaction: transaction,
    );
  }

  Future<Board> updateRow(
    _i1.Session session,
    Board row, {
    _i1.ColumnSelections<BoardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Board>(
      row,
      columns: columns?.call(Board.t),
      transaction: transaction,
    );
  }

  Future<List<Board>> delete(
    _i1.Session session,
    List<Board> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Board>(
      rows,
      transaction: transaction,
    );
  }

  Future<Board> deleteRow(
    _i1.Session session,
    Board row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Board>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Board>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BoardTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Board>(
      where: where(Board.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BoardTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Board>(
      where: where?.call(Board.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BoardAttachRowRepository {
  const BoardAttachRowRepository._();

  Future<void> owner(
    _i1.Session session,
    Board board,
    _i2.UserInfo owner,
  ) async {
    if (board.id == null) {
      throw ArgumentError.notNull('board.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $board = board.copyWith(ownerId: owner.id);
    await session.db.updateRow<Board>(
      $board,
      columns: [Board.t.ownerId],
    );
  }
}
