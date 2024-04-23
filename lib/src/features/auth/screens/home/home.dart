import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simple_shopping_app/src/repository/auth/auth_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(onPressed: (){
            AuthenticationRepository.instance.logout(); 
   },  icon: const Icon(Iconsax.logout))
        ],
        
        ),
      body: Center(child: Text('Home Screen')),
    );
  }
}