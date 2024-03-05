import 'package:get/get.dart';
import 'package:google_signin/model/auth/user_model.dart';
import 'package:google_signin/services/local/local_storage.dart';
import 'package:google_signin/services/social/signin_with_google.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  var logoutting = false.obs;

  var userInfo = Rx<UserModel?>(null);

  getUserInfo() async {
    var data = AppLocalStorage.getMapData("user_info");
    if (data != null) {
      userInfo.value = UserModel.fromJson(data);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  Future<bool> logout() async {
    await GoogleAuthSignIn().signOut(loading: (v) {
      logoutting.value = v;
    });
    AppLocalStorage.removeMapData("user_info");
    return true;
  }
}
