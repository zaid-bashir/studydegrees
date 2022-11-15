import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:studydegrees/app/modules/login/controllers/login_controller.dart';
import 'package:studydegrees/app/modules/resetpassword/views/resetpassword_view.dart';
import 'package:studydegrees/app/routes/app_pages.dart';
import 'package:studydegrees/constants/colors.dart';
import 'package:studydegrees/constants/images.dart';
import 'package:studydegrees/constants/styles.dart';

import '../../../../utils/utilities.dart';
import '../../../../views/app_main_button_view.dart';
import '../../../../views/custum_textform_field.dart';
import '../../homepage/views/homepage_view.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put<LoginController>(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Text(
                      "Welcome back ",
                      style: AppStyles().headingh1,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SvgPicture.asset(emoji2Auth),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Login to your account to continue your course.",
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
                //     "Or login with your email",
                //     style: AppStyles().headingh2,
                //   ),
                // ),
                Form(
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
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const ResetpasswordView());
                            },
                            child: Text(
                              "Forgot password?",
                              style: AppStyles().headingh2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
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
                                    .signInWithEmailAndPassword(
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
                                    message: "Logged In Successfully...",
                                    backgroundColor: Colors.green,
                                    duration: const Duration(seconds: 3),
                                    showProgressIndicator: true,
                                  ).show(context).then((value) {
                                    Get.offAll(() => const BottomAppBar());
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
                          height: 85,
                        ),
                      ],
                    )),
                Center(
                  child: SignInButton(
                    Buttons.GoogleDark,
                    padding: const EdgeInsets.all(0),
                    text: "Login with Google",
                    onPressed: () {
                      log("Google Login");
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
                    text: "Login with Facebook",
                    onPressed: () {
                      log("Facebook Login");
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.offAndToNamed(Routes.SIGNUP);
                    },
                    child: Text(
                      "I don't have an account yet",
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
