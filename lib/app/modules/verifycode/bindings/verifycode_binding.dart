import 'package:get/get.dart';

import '../controllers/verifycode_controller.dart';

class VerifycodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifycodeController>(
      () => VerifycodeController(),
    );
  }
}
