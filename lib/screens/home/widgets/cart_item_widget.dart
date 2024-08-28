// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:simple_shopping_app/constants/controllers.dart';
import 'package:simple_shopping_app/models/cart_item.dart';

import '../../../widgets/custom_text.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Padding(
          padding:
          const EdgeInsets.all(8.0),
          child: Image.network(
            cartItem.image,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                    child: CustomText(
                      text: cartItem.name, size: 20, weight: FontWeight.bold,
                    )),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(
                            Icons.chevron_left),
                        onPressed: () {
                          cartController.decreaseQuantity(cartItem);
                        }),
                    Padding(
                      padding:
                      const EdgeInsets.all(
                          8.0),
                      child: CustomText(
                        text: cartItem.quantity.toString(), size: 20, weight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons
                            .chevron_right),
                        onPressed: () {
                          cartController.increaseQuantity(cartItem);
                        }),
                  ],
                )
              ],
            )),
        Padding(
          padding:
          const EdgeInsets.all(14),
          child: CustomText(
            text: "\$${cartItem.cost}",
            size: 22,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
