import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/colors.dart';
import 'package:pizza_app/model/shop.dart';
import 'package:pizza_app/widget/button.dart';
import 'package:provider/provider.dart';

import 'model/food_model.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;

  void decrementQuntatiy() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
      ;
    });
  }

  void incrementQuntatiy() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text(
                  'successful add to cart',
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.check))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagePath ?? '',
                  height: 200,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.food.rating ?? '',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.food.name ?? '',
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients (such as various types of sausage, anchovies, mushrooms, onions, olives, vegetables, meat, ham, etc.), which is then baked at a high temperature, traditionally in a wood-fired oven.',
                  style: TextStyle(
                      fontSize: 20, height: 1.5, color: Colors.grey[700]),
                ),
              ],
            ),
          )),
          Container(
            padding: EdgeInsets.all(20),
            color: primaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' \$ ${widget.food.price}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                              onPressed: decrementQuntatiy,
                              icon: Icon(
                                Icons.remove,
                                color: primaryColor,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            quantityCount.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                              onPressed: incrementQuntatiy,
                              icon: Icon(
                                Icons.add,
                                color: primaryColor,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Button(text: 'Add to Cart', onTap: addToCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
