import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_signin/model/auth/user_model.dart';
import 'package:google_signin/services/local/local_storage.dart';
import 'package:google_signin/services/social/signin_with_google.dart';

class AuthController extends GetxController {
  var loading = false.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var authId = ''.obs;

  Future<bool> googleSignIn() async {
    UserModel? info = await GoogleAuthSignIn().signInWithGoogle();
    if (info != null) {
      AppLocalStorage.saveMapData("user_info", info.toJson());
      return true;
    }
    return false;
  }
}
