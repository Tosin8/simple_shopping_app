import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simple_shopping_app/src/constants/sizes.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold( 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: tDefaultSize * 5, left: tDefaultSize, right: tDefaultSize, bottom: tDefaultSize * 2), 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Iconsax.message, size: 100), 
            const SizedBox(height: tDefaultSize * 2), 
            const Text('Verify your email address', textAlign: TextAlign.center,), 
            const SizedBox(height: 12,), 
            const Text('We have just send email verification link to your email. Please check email and click that link to verify. ', textAlign: TextAlign.center,), 
            const SizedBox(height: 10,), 
            const Text('If not auto redirected after verfication, click on the continue button', textAlign: TextAlign.center,), 

            const SizedBox(height: 20,), 
            GestureDetector( 
              onTap:() {
                
              },
              child: Container(
                height: 20, width: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)), 
                  border: Border.all(color: Colors.white)
                ),
                child: const Text('Continue'),
              ),
            ), 
const SizedBox(height: 20,), 
TextButton(onPressed: (){}, 
child: const Text('Resend Email Link')), 
          ],
        ),
        ),
      )
    );
  }
}