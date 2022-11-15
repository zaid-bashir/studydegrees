import 'package:get/get.dart';

import '../controllers/whishlist_controller.dart';

class WhishlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhishlistController>(
      () => WhishlistController(),
    );
  }
}
