import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_app/src/constants/image_string.dart';
import 'package:simple_shopping_app/src/constants/text_string.dart';
import 'package:simple_shopping_app/src/features/auth/screens/signup/sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark; 

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Container(
        child: Column(
          children: [

const SizedBox(height: 50,), 
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(welcomeImage),
                )
              ),
            ) ,
            const SizedBox(height: 50,), 

          Text(tWelcomeTitle,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 18
            ),
            ), 
            const SizedBox(height: 10,),
            const Text(tWelcomeSubTitle, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, ),),
            const SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // LOGIN
               GestureDetector( 
                 onTap: () {},
                 child: Container(
                  height: 50, width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue, 
                  ),
                  child: const Align(
                    child: Text('LOGIN', style: TextStyle(color: Colors.white),)),
                 ),
               ), 
               const SizedBox(width: 20,), 

// SIGN UP
               GestureDetector( 
                 onTap: () {
                Get.to(() =>SignUpScreen); 
                 },
                 child: Container(
                  height: 50, width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.red)
                  ),
                  child: const Align(
                    child: Text('SIGN UP', style: TextStyle(color: Colors.black),)),
                 ),
               )
              ],
            )
          ],
        )
      ),
    );
  }
}