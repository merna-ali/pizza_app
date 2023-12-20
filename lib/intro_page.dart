import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/colors.dart';
import 'package:pizza_app/widget/button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pizza Delivery',
                style: GoogleFonts.aBeeZee(fontSize: 30, color: Colors.white),
              ),
              Image.asset('asset/images/delivery.png'),
              Text(
                'THE TASTE OF ITALIAN FOOD',
                style: GoogleFonts.aBeeZee(fontSize: 38, color: Colors.white),
              ),
              Text(
                'Feel the taste of the most popular italian food from anywhere and anytime',
                style: TextStyle(fontSize: 17, color: Colors.white, height: 2),
              ),
              Button(
                text: 'Get Started',
                onTap: () {
                  Navigator.pushNamed(context, "\menupage");
                },
              )
            ],
          ),
        ));
  }
}
