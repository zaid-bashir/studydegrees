// ignore_for_file: must_be_immutable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:studydegrees/app/modules/login/views/login_view.dart';
import 'package:studydegrees/constants/images.dart';
import 'package:studydegrees/constants/styles.dart';

import '../controllers/onboardingpage_controller.dart';

class OnBoardingPage extends GetView<HomeController> {
  OnBoardingPage({Key? key}) : super(key: key);
  Future<FirebaseApp> initialisation = Firebase.initializeApp();
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Get.offUntil(
        MaterialPageRoute(builder: (_) => const LoginView()), (route) => false);
  }

  Widget _buildImage(String assetName) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Image.asset(assetName, width: 350),
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return FutureBuilder(
        future: initialisation,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return IntroductionScreen(
              key: introKey,
              globalBackgroundColor: Colors.white,
              pages: [
                PageViewModel(
                  titleWidget: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      "Join and study together",
                      style: AppStyles().headingh1,
                    ),
                  ),
                  bodyWidget: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(
                      "Find your best experience while studying \nand seeking knowledge in here",
                      style: AppStyles().headingh2,
                    ),
                  ),
                  image: _buildImage(branding1),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  titleWidget: const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Find your mentors",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Red Hat Display',
                          color: Color(0XFF1D2D3A)),
                    ),
                  ),
                  bodyWidget: const Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "Find your best experience while studying \nand seeking knowledge in here",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Red Hat Display',
                          color: Color(0XFFA9AEB2)),
                    ),
                  ),
                  image: _buildImage(branding2),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  titleWidget: const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Let's get Started",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Red Hat Display',
                          color: Color(0XFF1D2D3A)),
                    ),
                  ),
                  bodyWidget: const Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "So what are you waiting for let's get started\nand explore the knowledge",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Red Hat Display',
                          color: Color(0XFFA9AEB2)),
                    ),
                  ),
                  decoration: pageDecoration,
                  image: _buildImage(branding3),
                ),
              ],
              onDone: () => _onIntroEnd(context),
              onSkip: () => _onIntroEnd(context),
              showSkipButton: false,
              skipOrBackFlex: 0,
              nextFlex: 0,
              showBackButton: true,
              back: const Icon(Icons.arrow_back),
              skip: const Text('Skip',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              next: const Icon(Icons.arrow_forward),
              done: const Text('Done',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              curve: Curves.fastLinearToSlowEaseIn,
              controlsMargin: const EdgeInsets.all(16),
              controlsPadding: kIsWeb
                  ? const EdgeInsets.all(12.0)
                  : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              dotsDecorator: const DotsDecorator(
                size: Size(10.0, 10.0),
                color: Color(0xFFBDBDBD),
                activeSize: Size(22.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              dotsContainerDecorator: const ShapeDecoration(
                color: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return const AlertDialog(
              title: Text("Study Degrees"),
              content: Text("Something Went Wrong..."),
            );
          }
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please Wait...")
                ],
              ),
            ),
          );
        }));
  }
}
