import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_app/src/repository/auth/auth_repository.dart';

import '../../../utils/helper.dart';

class MailVerificationController extends GetxController {
  late Timer _timer; 

  
  @override 
  void onInit() {
    super.onInit(); 
    sendVerificationEmail(); 
    setTimerForAutoRedirect(); 
  }

  Future<void> sendVerificationEmail() async {

    try {
await AuthenticationRepository.instance.sendEmailVerification(); 
    } catch(e) {
      Helpers.errorSnackBar(title: 'Oh Snap', message: e.toString()); 
    }

    await AuthenticationRepository.instance.sendEmailVerification(); 
  } 

  void setTimerForAutoRedirect(){
    _timer = Timer.periodic(const Duration(seconds: 3), 
    (timer) { 
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser; 
    if(user!.emailVerified){
      timer.cancel(); 
    }
  } 
  );
  }

  void manuallyCheckEmailVerificationStatus(){}
}