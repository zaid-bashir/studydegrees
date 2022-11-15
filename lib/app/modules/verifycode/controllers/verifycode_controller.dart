import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class VerifycodeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    logger.i("OnInit State Verifycode Controller");
  }

  //?Logger Instance for Logging
  //?===========================
  Logger logger = Logger();

  //?Variables for Reset Password View
  //?=========================
  TextEditingController verifyCodeController = TextEditingController();
  RxString code = "".obs;

  @override
  void onReady() {
    super.onReady();
    logger.i("OnReady State Verifycode Controller");
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("OnClose State Verifycode Controller");
  }
}
