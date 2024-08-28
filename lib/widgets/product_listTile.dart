import 'package:flutter/material.dart';


import 'custom_text.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return           Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('', width: 140,),
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    CustomText(text:"White Shoes", size: 18, weight: FontWeight.bold,),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    CustomText(text:"Nike", color: Colors.grey, size: 20, weight: FontWeight.bold,),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text:"\$18.0", size: 20, weight: FontWeight.bold, ),
                    const SizedBox(width: 100,),
                    IconButton(icon: const Icon(Icons.add_shopping_cart), 
                    onPressed: (){})
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    )
    ;
  }
}
