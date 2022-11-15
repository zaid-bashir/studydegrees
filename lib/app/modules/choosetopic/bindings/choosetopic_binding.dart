import 'package:get/get.dart';

import '../controllers/choosetopic_controller.dart';

class ChoosetopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoosetopicController>(
      () => ChoosetopicController(),
    );
  }
}
