import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../signup/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: h,
        width: w,
        child:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),), 
                const Text('Kindly enter your credentials \nto use your account', style: TextStyle(color: Colors.grey),),
                const SizedBox(height: 20,),
                Form(
                  child: Column(
                    children: [
                    TextFormField(
          
                      // Email
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.message),
                        prefixIconColor: Colors.grey,
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          
                        ),
                      )
                    ), 
                    const SizedBox(height: 20,), 
          
          // Password
                       TextFormField(
                        obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.key),
                        prefixIconColor: Colors.grey,
                        labelText: 'Password',
                        suffixIcon: const Icon(Iconsax.eye_slash),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          
                        ),
                      )
                    ),
                    const SizedBox(height: 20,),
                    const Row(
                      children: [
                        SizedBox(
                          width: 20,
                          child: Checkbox(
                            value: true, onChanged: null),
                        ),
                        SizedBox(width: 10,), 
                          Text('Remember Me')
                      ],
                    ), 
                    const SizedBox(height: 20,), 
          
                    // Button
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        height: 50,
                        width: 300, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10), 
                        ),
                        child: const Align(child: Text('LOGIN', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)),
                      ),
                    ), 
                    const SizedBox(height: 20,),
                    const Text('Forgot Password?', style: TextStyle(color: Colors.grey),), 
                    const SizedBox(height: 50,), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?', style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpScreen());
                            },
                            
                            child: const Text(' Sign Up', style: TextStyle(color: Colors.green),))
                        ],
                      ),
                    
                  ],)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}