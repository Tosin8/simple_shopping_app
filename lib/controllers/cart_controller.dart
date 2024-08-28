import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_app/models/cart_item.dart';
import 'package:simple_shopping_app/models/product.dart';
import 'package:simple_shopping_app/models/user.dart';

import 'package:uuid/uuid.dart';

import '../constants/app_constants.dart';
import '../constants/controllers.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice);
  }

  void addProductToCart(ProductModel product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        String itemId = Uuid().toString();
        userController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": 1,
              "price": product.price,
              "image": product.image,
              "cost": product.price
            }
          ])
        });
        Get.snackbar("Item added", "${product.name} was added to your cart");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      userController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
     // debugPrint(e.message);
    }
  }

  // changeCartTotalPrice(UserModel userModel) {
  //   totalCartPrice.value = 0.0;
  //   if (userModel.cart.isNotEmpty) {
  //     userModel.cart.forEach((cartItem) {
  //      // totalCartPrice += cartItem!.cost!!;
  //       totalCartPrice += cartItem!.cost!!?.value ?? 0.0;
  //     });
  //   }
  // }

  changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart.isNotEmpty) {
      userModel.cart.forEach((cartItem) {
        if (cartItem is CartItemModel) {
   //       totalCartPrice += cartItem.cost.toDouble();
    totalCartPrice.value += cartItem.cost ?? 0.0;
        }
      });
    }
  }

  bool _isItemAlreadyAdded(ProductModel product) =>
      userController.userModel.value.cart
          .where((item) => item.productId == product.id)
          .isNotEmpty;

  void decreaseQuantity(CartItemModel item){
    if(item.quantity == 1){
      removeCartItem(item);
    }else{
      removeCartItem(item);
      item.quantity--;
          userController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

    void increaseQuantity(CartItemModel item){
      removeCartItem(item);
      item.quantity++;
      logger.i({"quantity": item.quantity});
          userController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
  }
}
