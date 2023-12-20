import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/colors.dart';
import 'package:pizza_app/food_details_page.dart';
import 'package:pizza_app/model/shop.dart';
import 'package:pizza_app/widget/button.dart';
import 'package:provider/provider.dart';

import 'food_tile.dart';
import 'model/food_model.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFooDetailsPage(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetailsPage(
                  food: foodMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        title: Text(
          'Itali',
          style: TextStyle(color: Colors.grey[800], fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "\cartpage");
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Get 32% Promo',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(text: 'Buy Food', onTap: () {})
                  ],
                ),
                Image.asset(
                  'asset/images/pizza.png',
                  height: 130,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                  hintText: 'Search here'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Food Manu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) {
                    return FoodTile(
                      food: foodMenu[index],
                      ontap: () => navigateToFooDetailsPage(index),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Text(
              'Popular Food',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'asset/images/pizza-box.png',
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pepperoni Pizza',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$ 150',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.grey[500],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
