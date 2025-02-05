/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/board_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/userstream_endpoint.dart' as _i4;
import 'dart:typed_data' as _i5;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i6;
import 'package:serverpod_chat_server/serverpod_chat_server.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'board': _i2.BoardEndpoint()
        ..initialize(
          server,
          'board',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'userStream': _i4.UserStreamEndpoint()
        ..initialize(
          server,
          'userStream',
          null,
        ),
    };
    connectors['board'] = _i1.EndpointConnector(
      name: 'board',
      endpoint: endpoints['board']!,
      methodConnectors: {
        'getBoards': _i1.MethodConnector(
          name: 'getBoards',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['board'] as _i2.BoardEndpoint).getBoards(session),
        ),
        'addBoard': _i1.MethodConnector(
          name: 'addBoard',
          params: {
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['board'] as _i2.BoardEndpoint).addBoard(
            session,
            params['title'],
          ),
        ),
        'getBoard': _i1.MethodConnector(
          name: 'getBoard',
          params: {
            'uuid': _i1.ParameterDescription(
              name: 'uuid',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['board'] as _i2.BoardEndpoint).getBoard(
            session,
            params['uuid'],
          ),
        ),
        'saveBoard': _i1.MethodConnector(
          name: 'saveBoard',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'cover': _i1.ParameterDescription(
              name: 'cover',
              type: _i1.getType<_i5.ByteData>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['board'] as _i2.BoardEndpoint).saveBoard(
            session,
            params['id'],
            params['content'],
            params['cover'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['userStream'] = _i1.EndpointConnector(
      name: 'userStream',
      endpoint: endpoints['userStream']!,
      methodConnectors: {
        'addUserStreamToBoard': _i1.MethodConnector(
          name: 'addUserStreamToBoard',
          params: {
            'boardId': _i1.ParameterDescription(
              name: 'boardId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userStream'] as _i4.UserStreamEndpoint)
                  .addUserStreamToBoard(
            session,
            params['boardId'],
            params['userId'],
          ),
        ),
        'removeUserStreamFromBoard': _i1.MethodConnector(
          name: 'removeUserStreamFromBoard',
          params: {
            'boardId': _i1.ParameterDescription(
              name: 'boardId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userStream'] as _i4.UserStreamEndpoint)
                  .removeUserStreamFromBoard(
            session,
            params['boardId'],
            params['userId'],
          ),
        ),
        'getListUserStreamFromBoard': _i1.MethodConnector(
          name: 'getListUserStreamFromBoard',
          params: {
            'boardId': _i1.ParameterDescription(
              name: 'boardId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userStream'] as _i4.UserStreamEndpoint)
                  .getListUserStreamFromBoard(
            session,
            params['boardId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
    modules['serverpod_chat'] = _i7.Endpoints()..initializeEndpoints(server);
  }
}
