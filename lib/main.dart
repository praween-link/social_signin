import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_signin/routes/app_routes.dart';
import 'package:google_signin/routes/app_routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_signin/services/local/local_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppLocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Google Sign In',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppRoute.routes,
    );
  }
}
