import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_app/screens/home/home.dart';

import 'constants/firebase.dart';
import 'controllers/appController.dart';
import 'controllers/cart_controller.dart';
import 'controllers/product_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value){
    Get.put(AppController());
   // Get.put(UserController());
    Get.put(ProducsController());
    Get.put(CartController());
  //  Get.put(PaymentsController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
