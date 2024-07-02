import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';
import '../../../views/views/appbar_view.dart';
import '../controllers/whiteboard_controller.dart';

class WhiteboardView extends GetView<WhiteboardController> {
  const WhiteboardView({super.key});
  @override
  Widget build(BuildContext context) {
    // // load sample drawing data
    // final drawJson = jsonDecode(sampleDraw);
    // log('Draw items = ${drawJson.length}');
    // final simpleLine = SmoothLine.fromJson(drawJson[0]);
    // controller.drawingController.addContent(simpleLine);

    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Whiteboard',
        action: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Theme.of(context).colorScheme.primaryContainer),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primaryContainer,
                blurRadius: 2.0,
              ),
            ],
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: DrawingBoard(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            controller: controller.drawingController,
            showDefaultActions: true,
            showDefaultTools: true,
            boardPanEnabled: false,
            boardScaleEnabled: false,
            background: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
            ),
            onPointerUp: (pue) {
              final json = controller.drawingController.getJsonList();
              log('${jsonEncode(json.toJson())}');
            },
          ),
        ),
      ),
    );
  }
}

// sample drawing data
String sampleDraw =
    '[{"type":"SmoothLine","brushPrecision":0.4,"points":[{"dx":83.66667175292969,"dy":203.33334350585938},{"dx":82.33333587646484,"dy":202},{"dx":83,"dy":200.66668701171875},{"dx":85.66667175292969,"dy":200},{"dx":93.66667175292969,"dy":196},{"dx":103,"dy":190.66668701171875},{"dx":115,"dy":184.66668701171875},{"dx":129.6666717529297,"dy":176.66668701171875},{"dx":141.6666717529297,"dy":168.66668701171875},{"dx":159,"dy":158},{"dx":173.6666717529297,"dy":147.33334350585938},{"dx":187.6666717529297,"dy":138.66668701171875},{"dx":203,"dy":128.66668701171875},{"dx":217.6666717529297,"dy":118},{"dx":229.6666717529297,"dy":108},{"dx":244.33334350585938,"dy":99.33334350585938},{"dx":258.3333435058594,"dy":93.33334350585938},{"dx":270.3333435058594,"dy":87.33334350585938},{"dx":282.3333435058594,"dy":81.33334350585938},{"dx":291,"dy":78},{"dx":300.3333435058594,"dy":72},{"dx":307,"dy":69.33334350585938},{"dx":311.66668701171875,"dy":66}],"strokeWidthList":[14.124999999999996,14.524999999999997,14.924999999999997,14.524999999999997,14.124999999999996,13.724999999999996,13.324999999999996,12.924999999999995,12.524999999999995,12.124999999999995,11.724999999999994,11.324999999999994,10.924999999999994,10.524999999999993,10.124999999999993,9.724999999999993,9.324999999999992,8.924999999999992,8.524999999999991,8.124999999999991,7.724999999999991,7.32499999999999,6.92499999999999],"paint":{"blendMode":3,"color":4294198070,"filterQuality":3,"invertColors":false,"isAntiAlias":false,"strokeCap":1,"strokeJoin":1,"strokeWidth":14.124999999999996,"style":1}}]';
