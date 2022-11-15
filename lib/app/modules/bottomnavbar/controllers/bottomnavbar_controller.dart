import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BottomnavbarController extends GetxController {
  Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    logger.i("HomeController Init...");
  }

  RxInt selectedNavigationBarItem = 0.obs;

  @override
  void onReady() {
    super.onReady();
    logger.i("HomeController Ready...");
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("HomeController Closed...");
  }
}
