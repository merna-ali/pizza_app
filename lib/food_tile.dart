import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/food_model.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  void Function()? ontap;

  FoodTile({super.key, required this.food, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                food.imagePath ?? '',
                height: 110,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                food.name ?? '',
                style: GoogleFonts.aBeeZee(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${food.price ?? ''}',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          food.rating ?? '',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
