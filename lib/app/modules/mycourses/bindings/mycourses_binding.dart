import 'package:get/get.dart';

import '../controllers/mycourses_controller.dart';

class MycoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MycoursesController>(
      () => MycoursesController(),
    );
  }
}
