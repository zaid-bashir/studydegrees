import 'dart:developer';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studydegrees/app/routes/app_pages.dart';
import 'package:studydegrees/constants/colors.dart';
import 'package:studydegrees/constants/images.dart';
import 'package:studydegrees/constants/styles.dart';
import 'package:studydegrees/views/custum_textform_field.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomepageController controller =
        Get.put<HomepageController>(HomepageController());
    GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 220,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      scaffoldkey.currentState!.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: SvgPicture.asset(buy),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: SvgPicture.asset(notification),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Hi, ${controller.firebaseAuth.currentUser!.email!.split("@")[0].toString()}",
                      style: AppStyles()
                          .headingh1
                          .copyWith(color: Colors.white, fontSize: 22),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(emoji2Auth),
                  ],
                ),
                Text(
                  "Let's start learning!",
                  style: AppStyles()
                      .headingh1
                      .copyWith(color: Colors.white, fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              child: CustomTextFormField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SvgPicture.asset(search),
                  ),
                  textController: controller.searchController,
                  onChanged: ((query) {
                    log(query.toString());
                  }),
                  labelText: "",
                  hintText: "Search for anything",
                  borderColor: Colors.transparent),
            ),
          ],
        ),
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(controller.firebaseAuth.currentUser!.email!
                .split("@")[0]
                .toString()),
            accountEmail: Text(controller.firebaseAuth.currentUser!.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(controller
                      .firebaseAuth.currentUser!.photoURL ??
                  "https://grannyrosek-9.org/wp-content/uploads/2018/09/team.png"),
            ),
            onDetailsPressed: () {},
            decoration: BoxDecoration(color: primaryColor),
          ),
          ListTile(
            title: const Text('Explore'),
            leading: SvgPicture.asset(
              discovery,
              color: primaryColor,
            ),
            onLongPress: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Courses'),
            leading: SvgPicture.asset(
              play,
              color: primaryColor,
            ),
            onLongPress: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Whishlist'),
            leading: SvgPicture.asset(
              heart,
              color: primaryColor,
            ),
            onLongPress: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Profile'),
            leading: SvgPicture.asset(
              profile,
              color: primaryColor,
            ),
            onLongPress: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Support'),
            leading: Icon(
              Icons.report_problem_outlined,
              color: primaryColor,
            ),
            onLongPress: () {},
          ),
          const Divider(),
          ListTile(
              title: const Text('Logout'),
              leading: Icon(
                Icons.logout_outlined,
                color: primaryColor,
              ),
              onTap: () {
                controller.firebaseAuth.signOut().then((value) {
                  Flushbar(
                    icon: const Icon(
                      Icons.error_sharp,
                      size: 30,
                      color: Colors.white,
                    ),
                    progressIndicatorBackgroundColor: Colors.white,
                    title: "Study Degrees",
                    message: "User Logged Out Successfully",
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 3),
                    showProgressIndicator: true,
                  ).show(context).then((value) {
                    Get.offAllNamed(AppPages.LOGIN);
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
              }),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Popular course",
                  style: AppStyles().headingh1,
                ),
                const Spacer(),
                Text(
                  "See all",
                  style: AppStyles().headingh2.copyWith(color: primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
