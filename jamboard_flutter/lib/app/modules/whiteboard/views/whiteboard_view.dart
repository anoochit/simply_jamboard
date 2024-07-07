import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';
import 'package:jamboard_flutter/app/routes/app_pages.dart';
import '../controllers/whiteboard_controller.dart';

class WhiteboardView extends GetView<WhiteboardController> {
  const WhiteboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.offAllNamed(Routes.HOME),
          icon: Icon(Icons.dashboard_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
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
            // showDefaultActions: true,
            // showDefaultTools: true,
            boardPanEnabled: false,
            boardScaleEnabled: false,
            background: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
            ),
            onPointerUp: (p) {
              controller.saveBoard();
            },
          ),
        ),
      ),
    );
  }
}

// sample paint content
const paintContent = '''
[{"type":"SmoothLine","brushPrecision":0.4,"points":[{"dx":79.66667175292969,"dy":240.66668701171875},{"dx":80.33333587646484,"dy":240},{"dx":83,"dy":238.66668701171875},{"dx":84.33333587646484,"dy":234.66668701171875},{"dx":87,"dy":230},{"dx":90.33333587646484,"dy":227.33334350585938},{"dx":93,"dy":220.66668701171875},{"dx":96.33333587646484,"dy":216},{"dx":101,"dy":210},{"dx":104.33333587646484,"dy":203.33334350585938},{"dx":109,"dy":198.66668701171875},{"dx":114.33334350585938,"dy":191.33334350585938},{"dx":117,"dy":187.33334350585938},{"dx":122.33334350585938,"dy":180.66668701171875},{"dx":129.6666717529297,"dy":173.33334350585938},{"dx":134.33334350585938,"dy":166},{"dx":141.6666717529297,"dy":159.33334350585938},{"dx":149.6666717529297,"dy":149.33334350585938},{"dx":157,"dy":142},{"dx":164.33334350585938,"dy":132.66668701171875},{"dx":171.6666717529297,"dy":125.33334350585938},{"dx":178.33334350585938,"dy":120},{"dx":185.6666717529297,"dy":112.66668701171875},{"dx":193,"dy":106},{"dx":198.33334350585938,"dy":98.66668701171875},{"dx":205.6666717529297,"dy":91.33334350585938},{"dx":212.33334350585938,"dy":86},{"dx":219.6666717529297,"dy":81.33334350585938},{"dx":226.33334350585938,"dy":76},{"dx":231,"dy":72.66667175292969},{"dx":237.6666717529297,"dy":68},{"dx":244.33334350585938,"dy":62.66667175292969},{"dx":251,"dy":59.333343505859375},{"dx":257,"dy":58},{"dx":261.66668701171875,"dy":56.66667175292969},{"dx":265.66668701171875,"dy":54.66667175292969},{"dx":267,"dy":54}],"strokeWidthList":[16.750000000000004,17.150000000000002,16.750000000000004,16.350000000000005,15.950000000000005,15.550000000000004,15.150000000000004,14.750000000000004,14.350000000000003,13.950000000000003,13.550000000000002,13.150000000000002,12.750000000000002,12.350000000000001,11.950000000000001,11.55,11.15,10.75,10.35,9.95,9.549999999999999,9.149999999999999,8.749999999999998,8.349999999999998,7.9499999999999975,7.549999999999997,7.149999999999997,6.7499999999999964,6.349999999999996,5.949999999999996,5.549999999999995,5.149999999999995,4.749999999999995,5.149999999999995,5.549999999999995,5.949999999999996,6.349999999999996],"paint":{"blendMode":3,"color":4294198070,"filterQuality":3,"invertColors":false,"isAntiAlias":false,"strokeCap":1,"strokeJoin":1,"strokeWidth":16.750000000000004,"style":1}}]
''';
