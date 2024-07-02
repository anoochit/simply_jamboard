/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:typed_data' as _i2;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i3;

abstract class Board implements _i1.SerializableModel {
  Board._({
    this.id,
    required this.title,
    this.uuid,
    required this.content,
    this.cover,
    required this.modifiedAt,
    required this.ownerId,
    this.owner,
  });

  factory Board({
    int? id,
    required String title,
    String? uuid,
    required String content,
    _i2.ByteData? cover,
    required DateTime modifiedAt,
    required int ownerId,
    _i3.UserInfo? owner,
  }) = _BoardImpl;

  factory Board.fromJson(Map<String, dynamic> jsonSerialization) {
    return Board(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      uuid: jsonSerialization['uuid'] as String?,
      content: jsonSerialization['content'] as String,
      cover: jsonSerialization['cover'] == null
          ? null
          : _i1.ByteDataJsonExtension.fromJson(jsonSerialization['cover']),
      modifiedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['modifiedAt']),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.UserInfo.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String? uuid;

  String content;

  _i2.ByteData? cover;

  DateTime modifiedAt;

  int ownerId;

  _i3.UserInfo? owner;

  Board copyWith({
    int? id,
    String? title,
    String? uuid,
    String? content,
    _i2.ByteData? cover,
    DateTime? modifiedAt,
    int? ownerId,
    _i3.UserInfo? owner,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (uuid != null) 'uuid': uuid,
      'content': content,
      if (cover != null) 'cover': cover?.toJson(),
      'modifiedAt': modifiedAt.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
    };
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
    _i2.ByteData? cover,
    required DateTime modifiedAt,
    required int ownerId,
    _i3.UserInfo? owner,
  }) : super._(
          id: id,
          title: title,
          uuid: uuid,
          content: content,
          cover: cover,
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
    Object? cover = _Undefined,
    DateTime? modifiedAt,
    int? ownerId,
    Object? owner = _Undefined,
  }) {
    return Board(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      uuid: uuid is String? ? uuid : this.uuid,
      content: content ?? this.content,
      cover: cover is _i2.ByteData? ? cover : this.cover?.clone(),
      modifiedAt: modifiedAt ?? this.modifiedAt,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.UserInfo? ? owner : this.owner?.copyWith(),
    );
  }
}
