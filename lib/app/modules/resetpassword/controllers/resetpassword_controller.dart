import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ResetpasswordController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    logger.i("OnInit State Reset Password Controller");
  }

  //?Logger Instance for Logging
  //?===========================
  Logger logger = Logger();

  //?Variables for Reset Password View
  //?=========================
  RxBool isPasswordHide = true.obs;
  TextEditingController emailController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    logger.i("OnReady State Reset Password Controller");
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("OnClose State Reset Password Controller");
  }
}
