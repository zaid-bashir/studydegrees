import 'package:get/get.dart';

import '../controllers/bottomnavbar_controller.dart';

class BottomnavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavbarController>(
      () => BottomnavbarController(),
    );
  }
}
