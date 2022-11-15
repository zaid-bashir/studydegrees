import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studydegrees/app/modules/homepage/views/homepage_view.dart';
import 'package:studydegrees/constants/images.dart';
import 'package:studydegrees/constants/styles.dart';
import 'package:studydegrees/views/topicitem.dart';
import '../../../../views/app_main_button_view.dart';
import '../controllers/choosetopic_controller.dart';

class ChoosetopicView extends GetView<ChoosetopicController> {
  const ChoosetopicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ChoosetopicController controller =
        Get.put<ChoosetopicController>(ChoosetopicController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  "Pick your favorite topic",
                  style: AppStyles().headingh1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 21.0, right: 21.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Choose your favorite topic to help us deliver the most suitable course for you.",
                    style: AppStyles().headingh2,
                  ),
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Obx(() {
                          return topicItem("Art", art, () {
                            controller.isArtClicked.toggle();
                          }, controller.isArtClicked.value);
                        }),
                        const Spacer(),
                        Obx(
                          () => topicItem("Business", business, () {
                            controller.isBusinessClicked.toggle();
                          }, controller.isBusinessClicked.value),
                        ),
                        const Spacer(),
                        Obx(
                          () => topicItem("Culinary", culinary, () {
                            controller.isCulinaryClicked.toggle();
                          }, controller.isCulinaryClicked.value),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Obx(
                          () => topicItem("Coding", coding, () {
                            controller.isCodingClicked.toggle();
                          }, controller.isCodingClicked.value),
                        ),
                        const Spacer(),
                        Obx(
                          () => topicItem("Design", design, () {
                            controller.isDesignClicked.toggle();
                          }, controller.isDesignClicked.value),
                        ),
                        const Spacer(),
                        Obx(
                          () => topicItem("Gaming", gaming, () {
                            controller.isGamingClicked.toggle();
                          }, controller.isGamingClicked.value),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Obx(
                          () => topicItem("LifeStyle", lifestyle, () {
                            controller.isLifeStyleClicked.toggle();
                          }, controller.isLifeStyleClicked.value),
                        ),
                        const Spacer(),
                        Obx(
                          () => topicItem("Music", music, () {
                            controller.isMusicClicked.toggle();
                          }, controller.isMusicClicked.value),
                        ),
                        const Spacer(),
                        Obx(
                          () => topicItem("Sports", sport, () {
                            controller.isSportsClicked.toggle();
                          }, controller.isSportsClicked.value),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AppMainButtonView(
                  child: Text(
                    "Start your journey",
                    style: AppStyles().headingh3,
                  ),
                  onTap: () {
                    controller.logger.i("Start your journey Clicked...");
                    Get.offAll(() => const HomepageView());
                  }),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  "You can still change your topic again later",
                  style: AppStyles().headingh2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
