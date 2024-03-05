import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signin/model/auth/user_model.dart';

class GoogleAuthSignIn {
  Future<UserModel?> signInWithGoogle() async {
    // Trigger the authentication flow
    var googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var data = await FirebaseAuth.instance.signInWithCredential(credential);

    if (data.additionalUserInfo?.profile != null) {
      log("Google Login: ${jsonEncode(data.additionalUserInfo?.profile)}");
      return UserModel.fromJson(data.additionalUserInfo?.profile ?? {});
    }
    return null;
  }

  Future<bool> signOut({required Function loading}) async {
    loading(true);
    FirebaseAuth.instance.idTokenChanges().listen((User? user) async {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        await FirebaseAuth.instance.signOut();
        await GoogleSignIn().disconnect();
        print('User is signed out!');
      }
    });

    loading(false);
    return true;
  }
}
