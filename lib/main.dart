import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_app/auth/controller/controller.dart';

import 'auth/login/login.dart';

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();

// dependency injection of the auth controller. 
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform
  ).then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
  
      ),
      darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
     // themeMode: ThemeMode.dark,-- determing the theme of the app. 
      home: const LoginScreen()
    );
  }
}


