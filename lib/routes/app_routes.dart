import 'package:get/get.dart';
import 'package:google_signin/routes/app_bindings.dart';
import 'package:google_signin/routes/app_routes_name.dart';
import 'package:google_signin/views/auth/signin_screen.dart';
import 'package:google_signin/views/auth/splash_screen.dart';
import 'package:google_signin/views/home/home_screen.dart';

class AppRoute {
  AppRoute._();

  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
