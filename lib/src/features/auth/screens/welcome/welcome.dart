import 'package:flutter/material.dart';
import 'package:simple_shopping_app/src/constants/image_string.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(welcomeImage),
                )
              ),
            ) 
            Text(data)
          ],
        )
      ),
    );
  }
}