// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:studydegrees/app/modules/choosetopic/views/choosetopic_view.dart';
import 'package:studydegrees/app/modules/newpassword/controllers/newpassword_controller.dart';
import 'package:studydegrees/constants/images.dart';
import 'package:studydegrees/constants/styles.dart';
import '../../../../views/app_main_button_view.dart';
import '../../../../views/custum_textform_field.dart';

class NewpasswordView extends GetView<NewpasswordController> {
  const NewpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NewpasswordController controller =
        Get.put<NewpasswordController>(NewpasswordController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                          "New password",
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
                    "Set new password",
                    style: AppStyles().headingh1,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(emoji3Auth),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Enter your email and a verification code to reset the password will be sent to your email.",
                style: AppStyles().headingh2,
              ),
              const SizedBox(
                height: 48,
              ),
              Obx(() => CustomTextFormField(
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
              AppMainButtonView(
                  child: Text(
                    "Set new password",
                    style: AppStyles().headingh3,
                  ),
                  onTap: () {
                    controller.logger.i("Set new password Clicked...");
                    Get.to(() => const ChoosetopicView());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
