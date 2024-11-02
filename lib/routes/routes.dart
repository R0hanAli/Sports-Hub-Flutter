import 'package:get/get.dart';
import 'package:sports_hub/routes/routes_names.dart';
import 'package:sports_hub/screens/views/about_us.dart';
import 'package:sports_hub/screens/views/add_item.dart';
import 'package:sports_hub/screens/views/admin_gallery.dart';
import 'package:sports_hub/screens/views/admin_login.dart';
import 'package:sports_hub/screens/views/cart.dart';
import 'package:sports_hub/screens/views/contact_us.dart';
import 'package:sports_hub/screens/views/detail.dart';
import 'package:sports_hub/screens/views/gallery.dart';
import 'package:sports_hub/screens/views/home.dart';
import 'package:sports_hub/screens/views/login.dart';
import 'package:sports_hub/screens/views/splash.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splash,
          page: () => Splash(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.login,
          page: () => Login(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.gallery,
          page: () => Gallery(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.admin_gallery,
          page: () => AdminGallery(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.adminlogin,
          page: () => AdminLogin(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.home,
          page: () => Home(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.detail,
          page: () => Detail(
            product: Get.arguments,
          ),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.cart,
          page: () => Cart(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.add_item,
          page: () => AddItem(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.about_us,
          page: () => AboutUs(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.contact_us,
          page: () => ContactUs(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
