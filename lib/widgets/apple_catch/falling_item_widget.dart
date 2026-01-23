import 'package:flutter/material.dart';
import 'package:game_workspace/models/falling_item.dart';

class FallingItemWidget extends StatelessWidget {
  final FallingItem item;

  const FallingItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      left:  (screenWidth / 2) + (item.x * 300),
      top:  (screenHeight / 2) + (item.y * 300),
      child: Text(
      item.emoji,
      style: TextStyle(fontSize: 40),
    ),
    );
  }
}