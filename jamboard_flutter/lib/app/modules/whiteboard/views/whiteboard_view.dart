import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/whiteboard_controller.dart';

class WhiteboardView extends GetView<WhiteboardController> {
  const WhiteboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhiteboardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WhiteboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
