import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_app/src/repository/auth/auth_repository.dart';

class SignUpController extends GetxController{
  static SignUpController  get instance => Get.find();

  // text field controllers to get data from textfields

  final email = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  final phone = TextEditingController();

  // call this function from design and it wil do the rest
  void registerUser(String email, String password) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password); 
  }
}