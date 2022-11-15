// ignore_for_file: avoid_print, unused_local_variable

import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studydegrees/utils/utilities.dart';

import 'app/routes/app_pages.dart';

int? isFirstTime;
bool kIsWeb = true;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  await GetStorage.init();
  GetStorage onBoarding;
  Utilities? utilities;
  FirebaseAuth? firebaseAuth;

  //! For Web Version

  //?=========================================================
  // kIsWeb = true;
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //       apiKey: "AIzaSyDkvjY87OdGjplK0E6ZLUJBRJqbsEzShSQ",
  //       appId: "1:616621451530:web:01bfb8410884d46b92b2f3",
  //       messagingSenderId: "616621451530",
  //       projectId: "studydegrees"),
  // );
  // log("Initialised Web...");
  // firebaseAuth = FirebaseAuth.instance;
  //?=========================================================

  await initialisationBeforeSplash();
  if (Platform.isAndroid || Platform.isIOS) {
    log("Mobile App Initialised....");
    kIsWeb = false;
    await Firebase.initializeApp();
    firebaseAuth = FirebaseAuth.instance;
    onBoarding = GetStorage();
    utilities = Utilities();
    isFirstTime = onBoarding.read("ISFIRSTTIME");
    await onBoarding.write("ISFIRSTTIME", 1);
  } else {
    log("Web Initialised...");
    print("Web Initialesed");
    kIsWeb = true;
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDkvjY87OdGjplK0E6ZLUJBRJqbsEzShSQ",
          appId: "1:616621451530:web:01bfb8410884d46b92b2f3",
          messagingSenderId: "616621451530",
          projectId: "studydegrees"),
    );
    log("Initialised Web...");
    firebaseAuth = FirebaseAuth.instance;
  }
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        //! For Web Application

        //?===================================================
        // kIsWeb == true ? Colors.cyan
        //     : utilities!.buildMaterialColor(primaryColor),
        //?===================================================
      ),
      title: "Study Degrees",
      initialRoute: (isFirstTime == 0 || isFirstTime == null)
          ? AppPages.INITIAL
          : (firebaseAuth.currentUser == null
              ? AppPages.LOGIN
              : AppPages.BOTTOMNAVBAR),
      //! For Web Application
      //?====================================================
      // kIsWeb == true ? AppPages.INITIAL :
      //?====================================================

      getPages: AppPages.routes,
    ),
  );
}

Future<void> initialisationBeforeSplash() async {
  //Perform Heavy Load Tasks
  //========================
  await Future.delayed(const Duration(
    seconds: 2,
  ));
  FlutterNativeSplash.remove();
}
