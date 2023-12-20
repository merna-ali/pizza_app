import 'package:flutter/material.dart';
import 'package:pizza_app/colors.dart';
import 'package:provider/provider.dart';

import 'model/food_model.dart';
import 'model/shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void deleteFromCart(Food food, BuildContext context){
final shop = context.read<Shop>();
shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) =>
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('My Cart'),
            backgroundColor: primaryColor,
          ),
          body: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context, index) {
                final Food food = value.cart[index];
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: ListTile(
                leading: Image.asset(food.imagePath ?? '',height: 50,),
                title:Text(food.name ?? '',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                subtitle: Text(food.price ?? '',style: const TextStyle(fontSize: 18,height: 2),),
                trailing: IconButton(onPressed: () => deleteFromCart(food,context), icon:Icon(Icons.delete)),
              ),
            );
          }),
        ));
  }
}
