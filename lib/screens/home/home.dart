import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../widgets/custom_text.dart';
import 'widgets/products.dart';
import 'widgets/shopping_cart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: CustomText(
            text: "Sneex",
            size: 24,
            weight: FontWeight.bold,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ShoppingCartWidget(),
                    ),
                  );
                })
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        // drawer: Drawer(
        //   child: ListView(
        //     children: [
        //       Obx(()=>UserAccountsDrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.black
        //         ),
        //           accountName: Text(userController.userModel.value.name ?? ""),
        //           accountEmail: Text(userController.userModel.value.email ?? ""))),
        //       ListTile(
        //         leading: Icon(Icons.book),
        //         title: CustomText(
        //           text: "Payments History",
        //         ),
        //         onTap: ()async {
        //          paymentsController.getPaymentHistory();
        //         },
        //       ),
        //       ListTile(
        //         onTap: () {
        //           userController.signOut();
        //         },
        //         leading: Icon(Icons.exit_to_app),
        //         title: Text("Log out"),
        //       )
        //     ],
        //   ),
        // ),
        body: Container(
          color: Colors.white30,
          child: ProductsWidget(),
        ));
  }
}
