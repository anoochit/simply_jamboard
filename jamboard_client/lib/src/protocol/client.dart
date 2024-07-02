/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:jamboard_client/src/protocol/board.dart' as _i3;
import 'package:jamboard_client/src/protocol/user_stream.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'package:serverpod_chat_client/serverpod_chat_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointBoard extends _i1.EndpointRef {
  EndpointBoard(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'board';

  _i2.Future<List<_i3.Board>> getBoards() =>
      caller.callServerEndpoint<List<_i3.Board>>(
        'board',
        'getBoards',
        {},
      );

  _i2.Future<_i3.Board> addBoard(String title) =>
      caller.callServerEndpoint<_i3.Board>(
        'board',
        'addBoard',
        {'title': title},
      );

  _i2.Future<_i3.Board?> getBoard(String uuid) =>
      caller.callServerEndpoint<_i3.Board?>(
        'board',
        'getBoard',
        {'uuid': uuid},
      );

  _i2.Future<void> saveBoard(
    int id,
    String content,
  ) =>
      caller.callServerEndpoint<void>(
        'board',
        'saveBoard',
        {
          'id': id,
          'content': content,
        },
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointUserStream extends _i1.EndpointRef {
  EndpointUserStream(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userStream';

  _i2.Future<List<_i4.UserStream>> getUserStream(int boardId) =>
      caller.callServerEndpoint<List<_i4.UserStream>>(
        'userStream',
        'getUserStream',
        {'boardId': boardId},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
    chat = _i6.Caller(client);
  }

  late final _i5.Caller auth;

  late final _i6.Caller chat;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    board = EndpointBoard(this);
    example = EndpointExample(this);
    userStream = EndpointUserStream(this);
    modules = _Modules(this);
  }

  late final EndpointBoard board;

  late final EndpointExample example;

  late final EndpointUserStream userStream;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'board': board,
        'example': example,
        'userStream': userStream,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
        'auth': modules.auth,
        'chat': modules.chat,
      };
}
