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
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        border:
            Border.all(color: Theme.of(context).colorScheme.primaryContainer),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primaryContainer,
            blurRadius: 2.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Center(
          child: (board.cover != null)
              ? Image.memory(
                  board.cover!.buffer.asUint8List(),
                  errorBuilder: (context, error, stackTrace) => Container(),
                )
              : Container(),
        ),
      ),
    );
  }
}
