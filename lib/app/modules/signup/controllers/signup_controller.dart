import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SignupController extends GetxController {
  //?Logger Instance for Logging
  //?===========================
  Logger logger = Logger();

  //? Form Key
  var formKey = GlobalKey<FormState>();

  //?Variables for SignUp View
  //?=========================
  RxBool isPasswordHide = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loading = false.obs;
  //?Firebase Auth Instances
  //?=======================

  late FirebaseAuth firebaseAuth;
  late UserCredential userCredentials;

  @override
  void onInit() {
    super.onInit();
    firebaseAuth = FirebaseAuth.instance;
    logger.i("OnInit State Signup Controller");
  }

  @override
  void onReady() {
    super.onReady();
    logger.i("OnReady State Signup Controller");
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("OnClose State Signup Controller");
  }
}
