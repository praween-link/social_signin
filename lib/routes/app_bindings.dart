import 'package:get/get.dart';
import 'package:google_signin/controller/auth/auth_controller.dart';
import 'package:google_signin/controller/home/home_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
