import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_signin/controller/auth/auth_controller.dart';
import 'package:google_signin/routes/app_routes_name.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Get.toNamed(AppRoutes.home);
                var success = await _authController.googleSignIn();
                if (success) Get.toNamed(AppRoutes.home);
              },
              child: const Text("Sign In With Google"),
            ),
          ],
        ),
      ),
    );
  }
}
