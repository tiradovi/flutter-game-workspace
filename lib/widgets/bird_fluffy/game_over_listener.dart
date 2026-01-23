import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/bird_fluffy_provider.dart';

class GameOverListener extends StatefulWidget {
  const GameOverListener({super.key});

  @override
  State<GameOverListener> createState() => _GameOverListenerState();
}

class _GameOverListenerState extends State<GameOverListener> {
  bool _wasGameStarted = false;

  @override
  Widget build(BuildContext context) {
    final game = context.watch<BirdFluffyProvider>();
    final wasStarted = _wasGameStarted;

    _wasGameStarted = game.gameStarted;

    if (wasStarted && !game.gameStarted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showGameOverDialog(context, game);
      });
    }
    return const SizedBox.shrink();
  }

  void _showGameOverDialog(BuildContext context, BirdFluffyProvider game) {
    String message = "";
    if (game.gameTime >= game.targetTime) {
      message = "시간 종료";
    } else if (game.score >= game.targetScore) {
      message = "목표 달성";
    } else {
      message = "게임 오버";
    }

    showDialog(
      context: context,
      barrierDismissible: false, // 외부 클릭으로 닫히지 않도록
      builder: (context) => AlertDialog(
        title: const Text("게임 종료"),
        content: Text(
          "종료사유: $message\n플레이 시간: ${game.gameTime.toStringAsFixed(1)}초\n점수: ${game.score}",
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
              game.resetGame(); // 괄호 추가!
            },
            child: const Text("다시 시작"),
          ),
        ],
      ),
    );
  }
}