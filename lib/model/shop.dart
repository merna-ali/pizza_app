
import 'dart:core';
import 'package:flutter/cupertino.dart';

import 'food_model.dart';

class Shop extends ChangeNotifier {
 final List<Food> _foodMenu = [
    Food(
        name: 'Vegetable Pizza',
        price: '120',
        imagePath: 'asset/images/pizza (1).png',
        rating: '4.3'),
    Food(
        name: 'Mix Pizza',
        price: '240',
        imagePath: 'asset/images/pizza (3).png',
        rating: '3.9'),
    Food(
        name: 'Mushroom Pizza',
        price: '100',
        imagePath: 'asset/images/pizza (2).png',
        rating: '3.7'),
    Food(
        name: 'Margherita Pizza',
        price: '80',
        imagePath: 'asset/images/pizza (4).png',
        rating: '4.9'),
  ];
  List<Food> _cart =[];
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  void addToCart(Food foodItem , int qunatity){
    for(int i = 0; i< qunatity ; i++){
      _cart.add(foodItem);
      notifyListeners();
    }
  }
void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
}
}