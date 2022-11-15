import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studydegrees/constants/colors.dart';
import 'package:studydegrees/constants/images.dart';
import 'package:studydegrees/constants/styles.dart';
import 'package:studydegrees/utils/utilities.dart';
import '../../../../views/app_main_button_view.dart';
import '../../../../views/custum_textform_field.dart';
import '../../../routes/app_pages.dart';
import '../../homepage/views/homepage_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put<SignupController>(SignupController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Create account ",
                      style: AppStyles().headingh1,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SvgPicture.asset(emoji1Auth),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Create your account to start your course lessons.",
                  style: AppStyles().headingh2,
                ),
                const SizedBox(
                  height: 38,
                ),
                // Container(
                //   height: 62,
                //   decoration: BoxDecoration(
                //     color: primaryColor,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                // ),
                // const SizedBox(
                //   height: 38,
                // ),
                // Center(
                //   child: Text(
                //     "Or sign up with your email",
                //     style: AppStyles().headingh2,
                //   ),
                // ),
                Form(
                    autovalidateMode: AutovalidateMode.disabled,
                    key: controller.formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 38,
                        ),
                        CustomTextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Email Id";
                              } else if (!Utilities().isEmail(value)) {
                                return "Please Enter Valid Email";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                email,
                                width: 15,
                                height: 15,
                              ),
                            ),
                            textController: controller.emailController,
                            labelText: "Your Email",
                            hintText: "Email",
                            borderColor: Colors.transparent),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(() => CustomTextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Password";
                              } else if (value.length < 6) {
                                return "Password can't be less than 6 characters";
                              } else {
                                return null;
                              }
                            },
                            suffixIcononTap: () {
                              controller.isPasswordHide.toggle();
                            },
                            imagePathOfSuffixIcon:
                                controller.isPasswordHide.value == false
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Color(0XFF00A9B7),
                                      )
                                    : const Icon(Icons.visibility_off,
                                        color: Color(0XFF00A9B7)),
                            keyboardType: TextInputType.name,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                password,
                                width: 15,
                                height: 15,
                              ),
                            ),
                            obscureText: controller.isPasswordHide.value,
                            textController: controller.passwordController,
                            labelText: "Your Password",
                            hintText: "Password",
                            borderColor: Colors.transparent)),
                        const SizedBox(
                          height: 32,
                        ),
                        Obx(() => AppMainButtonView(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sign Up",
                                    style: AppStyles().headingh3,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  controller.loading.value == !false
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            onTap: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.loading.value = true;
                                controller.logger.i("SignUp Clicked...");
                                controller.firebaseAuth
                                    .createUserWithEmailAndPassword(
                                        email: controller.emailController.text,
                                        password:
                                            controller.passwordController.text)
                                    .then((value) {
                                  controller.loading.value = false;
                                  controller.userCredentials = value;
                                  if (kDebugMode) {
                                    print(
                                        controller.userCredentials.user!.email);
                                    print(controller.userCredentials.user!.uid);
                                  }
                                  Flushbar(
                                    icon: const Icon(
                                      Icons.done,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    progressIndicatorBackgroundColor:
                                        Colors.white,
                                    title: "Study Degrees",
                                    message: "Account Created Successfully...",
                                    backgroundColor: Colors.green,
                                    duration: const Duration(seconds: 3),
                                    showProgressIndicator: true,
                                  ).show(context).then((value) {
                                    Get.offAll(() => const HomepageView());
                                  });
                                  if (kDebugMode) {
                                    print(
                                        "User Created ===> ${value.additionalUserInfo}");
                                  }
                                }).onError((error, stackTrace) {
                                  if (kDebugMode) {
                                    print(error);
                                  }
                                  controller.loading.value = true;
                                  Flushbar(
                                    icon: const Icon(
                                      Icons.error_sharp,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    progressIndicatorBackgroundColor:
                                        Colors.white,
                                    title: "Study Degrees",
                                    message: error
                                        .toString()
                                        .split("]")[1]
                                        .toString(),
                                    backgroundColor: Colors.red,
                                    duration: const Duration(seconds: 3),
                                    showProgressIndicator: true,
                                  ).show(context);
                                  controller.loading.value = false;
                                });
                              } else {
                                controller.loading.value = true;
                                Future.delayed(const Duration(seconds: 1), () {
                                  controller.loading.value = false;
                                });
                              }
                            })),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    )),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'By continuing, you agree to our ',
                        style: AppStyles().headingh2,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms & Conditions\n',
                              style: AppStyles()
                                  .headingh2
                                  .copyWith(color: primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.logger.i("T&C Clicked...");
                                }),
                          TextSpan(
                            text: ' and ',
                            style: AppStyles().headingh2,
                          ),
                          TextSpan(
                              text: ' Privacy Policy',
                              style: AppStyles()
                                  .headingh2
                                  .copyWith(color: primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.logger
                                      .i("Privacy Policy Clicked...");
                                })
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SignInButton(
                    Buttons.GoogleDark,
                    padding: const EdgeInsets.all(0),
                    text: "Sign up with Google",
                    onPressed: () async {
                      log("Google SignIn");
                      final GoogleSignInAccount? googleSignInAccount =
                          await GoogleSignIn(scopes: <String>["email"])
                              .signIn();
                      final GoogleSignInAuthentication gooleAuth =
                          await googleSignInAccount!.authentication;
                      final credentails = GoogleAuthProvider.credential(
                          accessToken: gooleAuth.accessToken,
                          idToken: gooleAuth.idToken);
                      controller.firebaseAuth
                          .signInWithCredential(credentails)
                          .then((value) {
                        Flushbar(
                          icon: const Icon(
                            Icons.done,
                            size: 30,
                            color: Colors.white,
                          ),
                          progressIndicatorBackgroundColor: Colors.white,
                          title: "Study Degrees",
                          message: "Account Created Successfully...",
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 3),
                          showProgressIndicator: true,
                        ).show(context).then((value) {
                          log(credentails.toString());
                          Get.offAll(() => const BottomAppBar());
                        });
                      }).onError((error, stackTrace) {
                        Flushbar(
                          icon: const Icon(
                            Icons.error_sharp,
                            size: 30,
                            color: Colors.white,
                          ),
                          progressIndicatorBackgroundColor: Colors.white,
                          title: "Study Degrees",
                          message: error.toString().split("]")[1].toString(),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 3),
                          showProgressIndicator: true,
                        ).show(context);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SignInButton(
                    Buttons.FacebookNew,
                    padding: const EdgeInsets.all(0),
                    text: "Sign up with Facebook",
                    onPressed: () {
                      log("Facebook SignIn");
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.offAndToNamed(Routes.LOGIN);
                    },
                    child: Text(
                      "I already have an account",
                      style:
                          AppStyles().headingh2.copyWith(color: primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
