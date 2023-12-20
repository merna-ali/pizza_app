import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  final void Function()? onTap;

  Button({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Color.fromARGB(255, 138, 60, 50), fontSize: 18),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_outlined,
                color: Color.fromARGB(255, 138, 60, 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}
