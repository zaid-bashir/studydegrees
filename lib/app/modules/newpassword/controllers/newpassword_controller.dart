import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class NewpasswordController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    logger.i("OnInit State New Password Controller");
  }

  //?Logger Instance for Logging
  //?===========================
  Logger logger = Logger();

  //?Variables for New Password View
  //?=========================
  RxBool isPasswordHide = true.obs;
  TextEditingController passwordController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    logger.i("OnReady State New Password Controller");
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("OnClose State New Password Controller");
  }
}
