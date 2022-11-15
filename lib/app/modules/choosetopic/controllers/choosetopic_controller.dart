import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ChoosetopicController extends GetxController {
  Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    logger.i("ChoosetopicController Init...");
  }

  RxBool isArtClicked = false.obs;
  RxBool isBusinessClicked = false.obs;
  RxBool isCulinaryClicked = false.obs;
  RxBool isCodingClicked = false.obs;
  RxBool isDesignClicked = false.obs;
  RxBool isGamingClicked = false.obs;
  RxBool isLifeStyleClicked = false.obs;
  RxBool isMusicClicked = false.obs;
  RxBool isSportsClicked = false.obs;

  @override
  void onReady() {
    super.onReady();
    logger.i("ChoosetopicController Ready...");
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("ChoosetopicController Delete...");
  }
}
