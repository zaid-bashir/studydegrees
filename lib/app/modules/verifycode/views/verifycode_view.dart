import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:studydegrees/app/modules/newpassword/views/newpassword_view.dart';
import 'package:studydegrees/constants/colors.dart';

import '../../../../constants/images.dart';
import '../../../../constants/styles.dart';
import '../../../../views/app_main_button_view.dart';
import '../controllers/verifycode_controller.dart';

class VerifycodeView extends GetView<VerifycodeController> {
  const VerifycodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VerifycodeController controller =
        Get.put<VerifycodeController>(VerifycodeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0XFFFFFFFF),
                          blurRadius: 2.0,
                          spreadRadius: 2,
                          offset: Offset(
                            0,
                            0,
                          ),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0, bottom: 30),
                        child: Text(
                          "Verify",
                          style: AppStyles().headingh1.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              Row(
                children: [
                  Text(
                    "Recovery code",
                    style: AppStyles().headingh1,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(emoji4Auth),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Check your inbox, we have send the Verification code to your email.",
                style: AppStyles().headingh2,
              ),
              const SizedBox(
                height: 48,
              ),
              PinCodeTextField(
                showCursor: true,
                cursorColor: Colors.cyan,
                length: 4,
                obscureText: true,
                animationType: AnimationType.scale,
                pinTheme: PinTheme(
                  inactiveColor: Colors.cyan,
                  inactiveFillColor: Colors.cyan,
                  selectedFillColor: Colors.transparent,
                  selectedColor: Colors.cyan,
                  activeColor: Colors.cyan,
                  disabledColor: Colors.cyan,
                  errorBorderColor: Colors.red,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: controller.verifyCodeController,
                onCompleted: (v) {
                  if (kDebugMode) {
                    log("Verification Code Completed: ${controller.verifyCodeController.text}");
                  }
                },
                onChanged: (codeValue) {
                  if (kDebugMode) {
                    log("Verification Code ---> : ${controller.verifyCodeController.text}");
                  }
                  controller.code.value = codeValue;
                },
                beforeTextPaste: (text) {
                  if (kDebugMode) {
                    log("Verification Code paste $text");
                  }
                  /*if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  but you can show anything you want here, like your pop up saying wrong paste format or etc*/
                  return false;
                },
                appContext: context,
              ),
              const SizedBox(
                height: 32,
              ),
              AppMainButtonView(
                  child: Text(
                    "Verify",
                    style: AppStyles().headingh3,
                  ),
                  onTap: () {
                    controller.logger.i("Verify Button Clicked...");
                    Get.to(() => const NewpasswordView());
                  }),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Not retrieve any code? ',
                      style: AppStyles().headingh2,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Resend Code',
                            style: AppStyles()
                                .headingh2
                                .copyWith(color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.logger.i("Resend Code Clicked");
                              }),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
