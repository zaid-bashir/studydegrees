import 'dart:developer';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studydegrees/app/modules/homepage/views/homepage_view.dart';
import 'package:studydegrees/app/modules/mycourses/views/mycourses_view.dart';
import 'package:studydegrees/app/modules/profile/views/profile_view.dart';
import 'package:studydegrees/app/modules/whishlist/views/whishlist_view.dart';
import 'package:studydegrees/constants/colors.dart';
import 'package:studydegrees/constants/images.dart';

import '../controllers/bottomnavbar_controller.dart';

class BottonNavBarView extends GetView<BottomnavbarController> {
  const BottonNavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
    BottomnavbarController controller =
        Get.put<BottomnavbarController>(BottomnavbarController());
    List<Widget> pages = const [
      HomepageView(),
      MycoursesView(),
      WhishlistView(),
      ProfileView()
    ];
    return Scaffold(
      body: Obx(() {
        return pages[controller.selectedNavigationBarItem.value];
      }),
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey,
        index: controller.selectedNavigationBarItem.value,
        height: 60.0,
        items: <Widget>[
          Column(
            children: [
              Obx(() => SvgPicture.asset(
                    discovery,
                    color: controller.selectedNavigationBarItem.value == 0
                        ? primaryColor
                        : Colors.grey,
                  )),
              const Text("Explore")
            ],
          ),
          Column(
            children: [
              Obx(() => SvgPicture.asset(
                    play,
                    color: controller.selectedNavigationBarItem.value == 1
                        ? primaryColor
                        : Colors.grey,
                  )),
              const Text("Courses")
            ],
          ),
          Column(
            children: [
              Obx(() => SvgPicture.asset(
                    heart,
                    color: controller.selectedNavigationBarItem.value == 2
                        ? primaryColor
                        : Colors.grey,
                  )),
              const Text("Whishlist")
            ],
          ),
          Column(
            children: [
              Obx(() => SvgPicture.asset(
                    profile,
                    color: controller.selectedNavigationBarItem.value == 3
                        ? primaryColor
                        : Colors.grey,
                  )),
              const Text("Profile")
            ],
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: primaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          controller.selectedNavigationBarItem.value = index;
          log("Selected Index ===> ${controller.selectedNavigationBarItem.value + 1}");
          controller.logger.i(
              "Selected Index ===> ${controller.selectedNavigationBarItem.value + 1}");
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
