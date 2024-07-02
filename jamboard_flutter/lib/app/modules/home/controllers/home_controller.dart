import 'package:get/get.dart';
import 'package:jamboard_client/jamboard_client.dart';

import '../../../../serverpod.dart';

class HomeController extends GetxController {
  // late StreamingConnectionHandler? connectionHandler;

  // RxString data = ''.obs;
  RxList<Board> listBoards = <Board>[].obs;

  @override
  void onInit() {
    super.onInit();

    // get boards
    getBoards();
  }

  Future<Board> addBoard({required String title}) async {
    final board = await client.board.addBoard(title);
    // update board list
    getBoards();
    return board;
  }

  Future<void> getBoards() async {
    final boards = await client.board.getBoards();
    listBoards.value = boards;
  }
}
