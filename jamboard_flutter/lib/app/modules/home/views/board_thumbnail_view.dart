import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';

class BoardThumbnailView extends GetView {
  const BoardThumbnailView(
      {super.key, required this.board, required this.onTap});

  final Board board;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: Theme.of(context).colorScheme.primaryContainer),
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () => onTap(),
        child: Center(
          child: Text(
            '${board.uuid}',
          ),
        ),
      ),
    );
  }
}
