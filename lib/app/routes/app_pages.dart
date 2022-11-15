import 'package:get/get.dart';

import '../modules/bottomnavbar/bindings/bottomnavbar_binding.dart';
import '../modules/bottomnavbar/views/bottomnavbar_view.dart';
import '../modules/choosetopic/bindings/choosetopic_binding.dart';
import '../modules/choosetopic/views/choosetopic_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mycourses/bindings/mycourses_binding.dart';
import '../modules/mycourses/views/mycourses_view.dart';
import '../modules/newpassword/bindings/newpassword_binding.dart';
import '../modules/newpassword/views/newpassword_view.dart';
import '../modules/onboarding/bindings/homepage_binding.dart';
import '../modules/onboarding/views/onboardingpage.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/resetpassword/views/resetpassword_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/verifycode/bindings/verifycode_binding.dart';
import '../modules/verifycode/views/verifycode_view.dart';
import '../modules/whishlist/bindings/whishlist_binding.dart';
import '../modules/whishlist/views/whishlist_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.ONBOARDINGPAGE;
  static const HOMEPAGE = Routes.HOMEPAGE;
  static const SIGNUP = Routes.SIGNUP;
  static const LOGIN = Routes.LOGIN;
  static const RESETPASSWORD = Routes.RESETPASSWORD;
  static const VERIFYCODE = Routes.VERIFYCODE;
  static const NEWPASSWORD = Routes.NEWPASSWORD;
  static const CHOOSETOPIC = Routes.CHOOSETOPIC;
  static const BOTTOMNAVBAR = Routes.BOTTOMNAVBAR;
  static const MYCOURSES = Routes.MYCOURSES;
  static const WHISHLIST = Routes.WHISHLIST;
  static const PROFILE = Routes.PROFILE;
  static final routes = [
    GetPage(
      name: _Paths.ONBOARDINGPAGE,
      page: () => OnBoardingPage(),
      binding: OnBoardingPageBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => const ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFYCODE,
      page: () => const VerifycodeView(),
      binding: VerifycodeBinding(),
    ),
    GetPage(
      name: _Paths.NEWPASSWORD,
      page: () => const NewpasswordView(),
      binding: NewpasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSETOPIC,
      page: () => const ChoosetopicView(),
      binding: ChoosetopicBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAVBAR,
      page: () => const BottonNavBarView(),
      binding: BottomnavbarBinding(),
    ),
    GetPage(
      name: _Paths.MYCOURSES,
      page: () => const MycoursesView(),
      binding: MycoursesBinding(),
    ),
    GetPage(
      name: _Paths.WHISHLIST,
      page: () => const WhishlistView(),
      binding: WhishlistBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
