import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/features/auth/screens/welcome/welcome.dart';
import 'src/utils/theme.dart';

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();

// dependency injection of the auth controller. 

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
      theme: AppTheme.lightTheme, 
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const WelcomeScreen()
    );
  }
}


