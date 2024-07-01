import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';

class BoardThumbnailView extends GetView {
  final Board board;

  const BoardThumbnailView({super.key, required this.board});
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          //
        },
        child: Center(
          child: Text(
            '${board.uuid}',
          ),
        ),
      ),
    );
  }
}
