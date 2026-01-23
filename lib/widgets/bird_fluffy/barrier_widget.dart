import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/game_assets.dart';
import '../../providers/bird_fluffy_provider.dart';

class BarrierWidget extends StatelessWidget {
  const BarrierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<BirdFluffyProvider>();

    return Stack(
      children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            alignment: Alignment(game.barrierX, -1),
            child: Image.asset(
              GameAssets.birdFluffyBarrier,
              width: 80,
              height: game.barrierHeight,
              fit: BoxFit.fill,
            )),
        AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            alignment: Alignment(game.barrierX, 1),
            child: Transform.flip(
                flipY: true,
                child: Image.asset(
                  GameAssets.birdFluffyBarrier,
                  width: 80,
                  height: game.barrierHeight,
                  fit: BoxFit.fill,
                )))
      ],
    );
  }
}
