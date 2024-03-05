import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_signin/controller/home/home_controller.dart';
import 'package:google_signin/routes/app_routes_name.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          _homeController.logoutting.value
              ? const SizedBox(
                  height: 14, width: 14, child: CircularProgressIndicator())
              : IconButton(
                  onPressed: () {
                    _homeController.logout();
                    Get.offAllNamed(AppRoutes.signin);
                  },
                  icon: const Icon(Icons.logout),
                ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                _homeController.userInfo.value?.picture ?? '',
                fit: BoxFit.cover,
                height: 90,
                width: 90,
              ),
            ),
            Text(
                "Name: ${_homeController.userInfo.value?.givenName} ${_homeController.userInfo.value?.familyName}"),
            Text("Email: ${_homeController.userInfo.value?.email}"),

            //
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {
                //
              },
              child: const Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
