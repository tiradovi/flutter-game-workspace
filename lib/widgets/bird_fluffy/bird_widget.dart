import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/game_assets.dart';
import '../../providers/bird_fluffy_provider.dart';

class BirdWidget extends StatelessWidget {
  const BirdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<BirdFluffyProvider>();
    final birdY = game.birdY;

    final birdImage = game.gameStarted
        ? (game.isHolding
            ? GameAssets.birdFluffyFlyBird
            : GameAssets.birdFluffyFallBird)
        : GameAssets.birdFluffyLoading;

    final double birdSize = game.gameStarted
        ? game.isHolding
            ? 50
            : 55
        : 150;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      alignment: Alignment(0, birdY),
      child: SizedBox(
        width: birdSize,
        height: birdSize,
        child: Image.asset(
          birdImage,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
