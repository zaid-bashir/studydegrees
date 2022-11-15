import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomepageController extends GetxController {
  Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    firebaseAuth = FirebaseAuth.instance;
    logger.i("HomeController Init...");
  }

  TextEditingController searchController = TextEditingController();
  late FirebaseAuth firebaseAuth;

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
