/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'board.dart' as _i2;
import 'example.dart' as _i3;
import 'user_stream.dart' as _i4;
import 'package:jamboard_client/src/protocol/board.dart' as _i5;
import 'package:jamboard_client/src/protocol/user_stream.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'package:serverpod_chat_client/serverpod_chat_client.dart' as _i8;
export 'board.dart';
export 'example.dart';
export 'user_stream.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Board) {
      return _i2.Board.fromJson(data) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data) as T;
    }
    if (t == _i4.UserStream) {
      return _i4.UserStream.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Board?>()) {
      return (data != null ? _i2.Board.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.UserStream?>()) {
      return (data != null ? _i4.UserStream.fromJson(data) : null) as T;
    }
    if (t == List<_i5.Board>) {
      return (data as List).map((e) => deserialize<_i5.Board>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.UserStream>) {
      return (data as List).map((e) => deserialize<_i6.UserStream>(e)).toList()
          as dynamic;
    }
    try {
      return _i7.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i7.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_chat.$className';
    }
    if (data is _i2.Board) {
      return 'Board';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.UserStream) {
      return 'UserStream';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i7.Protocol().deserializeByClassName(data);
    }
    if (data['className'].startsWith('serverpod_chat.')) {
      data['className'] = data['className'].substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Board') {
      return deserialize<_i2.Board>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'UserStream') {
      return deserialize<_i4.UserStream>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
