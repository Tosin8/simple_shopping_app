import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/features/auth/screens/home/home.dart';
import '../../src/features/auth/screens/login/login.dart';

class AuthController extends GetxController{

  static AuthController instance = Get.find(); 
  late Rx<User?> _user; 

  FirebaseAuth auth = FirebaseAuth.instance; // to be able to access alot of property from firebase. 

  @override
  void onReady(){
    super.onReady(); 
    _user = Rx<User?>(auth.currentUser); // to call the user model anywhere on the app
    _user.bindStream(auth.userChanges()); // to listen to user changes
    ever(_user, _initialScreen); 
  }

// taking the user to the homepage, condition if the user is login or not. 


  _initialScreen(User? user){
    if(user==null){
      print('login page');
       Get.offAll(()=>const LoginScreen());}
       else{
        Get.offAll( ()=>const HomeScreen());
       }
  }
// create function for registration 
void register(String email, password)  async {

  try{
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  catch(e){
    Get.snackbar('About User', 'User Message', 
    snackPosition: SnackPosition.BOTTOM, 
    duration: const Duration(seconds: 8),
    borderRadius:10, 
    backgroundColor: Colors.redAccent,
    titleText: const Text('Account Creation failed', style: TextStyle(color: Colors.white),
    ),
    messageText: Text(e.toString(), 
    style: const TextStyle(color: Colors.white),
    )
    ); 
  }
  }
  

}