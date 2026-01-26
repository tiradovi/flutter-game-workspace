import 'package:flutter/material.dart';
import 'package:game_workspace/models/game_item.dart';
import 'package:provider/provider.dart';

import '../providers/bird_fluffy_provider.dart';
import '../widgets/bird_fluffy/game_area_widget.dart';
import '../widgets/bird_fluffy/ground_widget.dart';
import '../widgets/bird_fluffy/score_widget.dart';

//    return GameScreen(gameId: id, gameItem:game);
// 에러가 발생하지 않도록
/*
class GameScreen extends StatelessWidget {
  @override
  사이 수정하기!
 */
class BirdFluffyScreen extends StatelessWidget {
  final String gameId;
  final GameItem? gameItem;
  const BirdFluffyScreen(
      {super.key,
        required this.gameId,
        this.gameItem}
      );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: (_) {
          final game = context.read<BirdFluffyProvider>();
          if (!game.gameStarted) {
            game.startGame();
          } else {
            game.startHolding();
          }
        },
        onPointerUp: (_) {
          final game = context.read<BirdFluffyProvider>();
          game.stopHolding();
          if (game.gameStarted) {
            game.jump();
          }
        },
        child: const Column(
          children: [
            ScoreWidget(),
            GameArea(),
            GroundWidget(),
          ],
        ),
      ),
    );
  }
}