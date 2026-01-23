import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_workspace/models/game_item.dart';
import 'package:go_router/go_router.dart';

class GameCard extends StatelessWidget {
  final GameItem game;

  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/${game.id}', extra: game),
      child: Container(
        decoration: BoxDecoration(
          color: game.color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            if (game.imageAsset != null)
              Image.asset(
                game.imageAsset!,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            if (game.icon != null)
              Icon(game.icon, size: 64, color: Colors.white),
            const SizedBox(height: 16),
            Text(
              game.name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}