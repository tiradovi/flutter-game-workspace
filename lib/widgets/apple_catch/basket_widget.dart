import 'package:flutter/material.dart';

class BasketWidget extends StatelessWidget {
  final double x;  // -1.0 ~ 1.0

  const BasketWidget({super.key, required this.x});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left:  (MediaQuery.of(context).size.width / 2) + (x * 150) - 30,
      child: Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.brown.shade700,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '🧺',
          style: TextStyle(fontSize: 40),
        ),
      ),
    ),
    );
  }
}
