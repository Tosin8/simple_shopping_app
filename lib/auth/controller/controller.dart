import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  final AuthController instance = Get.find(); 
  late Rx<User?> _user; 
}