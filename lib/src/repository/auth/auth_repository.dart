import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_app/src/features/auth/screens/home/home.dart';
import 'package:simple_shopping_app/src/repository/auth/exceptions/signup_email_pwd_failure.dart';

import '../../features/auth/screens/welcome/welcome.dart';

class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance => Get.find(); 

  /// variables 
  final _auth = FirebaseAuth.instance; 
  late final Rx<User?> firebaseUser; 

  @override 
  void onReady(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges()); 
    ever(firebaseUser, _setInitialScreen);
  }

// Setting Initial Screen

  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const HomeScreen());
  }

/* ---------- Email & Pwd sign in ---------------*/

// to create an account
  Future<void> createUserWithEmailAndPassword(String email, String password) async{

    try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseUser.value != null ? Get.offAll(() => const HomeScreen()) : Get.offAll(() => const WelcomeScreen());
  } on FirebaseAuthException catch(e){
    final ex = SignUpWithEmailAndPasswordFailure.code(e.code); 
    print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    throw ex;
  } catch (_) {
    const ex = SignUpWithEmailAndPasswordFailure();
    print('EXCEPTION - ${ex.message}');
    throw ex; 
  }
}

// to login in

  Future<void> loginWithEmailAndPassword(String email, String password) async{

    try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch(e){
    
  } catch (_) {}
}

// for verification
Future<void> sendEmailVerification() async {
  _auth.currentUser.sendEmailVerification(); 
}

// to log out
Future<void> logout() async => await _auth.signOut();
}
