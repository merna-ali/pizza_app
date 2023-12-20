import 'package:flutter/material.dart';
import 'package:pizza_app/cart_page.dart';
import 'package:pizza_app/model/shop.dart';
import 'package:provider/provider.dart';

import 'intro_page.dart';
import 'menu_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Shop(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const IntroPage(),
      routes: {
        "\intropage": (context) => const IntroPage(),
        "\menupage": (context) => const MenuPage(),
        "\cartpage": (context) => const CartPage()
      },
    );
  }
}
