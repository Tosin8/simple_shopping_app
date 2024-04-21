import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      body: Container(
        height: h,
        width: w,
        child:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),), 
              Text('Kindly enter your credentials \nto use your account', style: TextStyle(color: Colors.grey),),
              SizedBox(height: 20,),
              Form(
                child: Column(
                  children: [
                  TextFormField()
                ],)),
            ],
          ),
        ),
      ),
    );
  }
}