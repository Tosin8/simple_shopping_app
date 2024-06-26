import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simple_shopping_app/src/features/auth/controllers/signup_controller.dart';

import '../../../../../auth/controller/validators.dart';
import '../login/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    
  final _formKey = GlobalKey<FormState>();
    final hidePassword = true.obs;
   
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        
        child:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Create Account", 
                
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),), 

                const Text('Kindly enter your credentials \nto create your account', 
                style: TextStyle(color: Colors.grey),),
                const SizedBox(height: 20,),

                Form(
                  key: _formKey, 
                  child: Column(
                    children: [
                    TextFormField(
          
                      // Email
                      validator: (value) => Validators.validateEmail(value),
                 controller: controller.email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
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

 // user name
                     TextFormField(
          validator: (value) => Validators.validateEmptyText('User Name', value),
                    controller: controller.userName, 
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,  
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.user),
                        prefixIconColor: Colors.grey,
                        labelText: 'User Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          
                        ),
                      )
                    ), 
                    const SizedBox(height: 20,), 

                    // Phone Number
TextFormField(
          validator: (value) => Validators.validatePhoneNumber(value),
            controller: controller.phone, 
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.mobile),
                        prefixIconColor: Colors.grey,
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          
                        ),
                      )
                    ), 
                    const SizedBox(height: 20,), 
                    
          
          // Password
                       Obx(() =>
                          TextFormField(
                            controller: controller.password,
                          validator: (value) => Validators.validatePassword( value),
                      
                        obscureText: hidePassword.value,
                                               textInputAction: TextInputAction.done,
                                               decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.key),
                          prefixIconColor: Colors.grey,
                          labelText: 'Password',
                          suffixIcon: IconButton(
                  onPressed: () => hidePassword.value = !hidePassword.value, 
                 icon: Icon(hidePassword.value ? Iconsax.eye_slash : Iconsax.eye) , 
              ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            
                          ),
                                               )
                                             ),
                       ),
                    const SizedBox(height: 40,),
                  
                
          
                    // Button
                    GestureDetector(
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 300, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10), 
                        ),
                        child: const Align(child: Text('SIGN UP', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)),
                      ),
                    ), 
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('I have an account?', style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const LoginScreen());
                            },
                            
                            child: const Text(' Login', style: TextStyle(color: Colors.green),))
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