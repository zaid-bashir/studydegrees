import 'package:get/get.dart';

import '../controllers/onboardingpage_controller.dart';

class OnBoardingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
