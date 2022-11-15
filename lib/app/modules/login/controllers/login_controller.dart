// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    firebaseAuth = FirebaseAuth.instance;
    logger.i("OnInit State Login Controller");
  }

  //?Logger Instance for Logging
  //?===========================
  Logger logger = Logger();

  //?Variables for Login View
  //?=========================
  RxBool isPasswordHide = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loading = false.obs;
  var formKey = GlobalKey<FormState>();
  //?Firebase Auth Instances
  //?=======================

  late FirebaseAuth firebaseAuth;
  late UserCredential userCredentials;

  @override
  void onReady() {
    super.onReady();
    logger.i("OnReady State Login Controller");
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("OnClose State Login Controller");
  }
}
