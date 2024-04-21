import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../shop/home/home.dart';
import '../login/login.dart';

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
void register(String email, password,) {

  try{
    auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  catch(e){
    
  }
  }
  

}