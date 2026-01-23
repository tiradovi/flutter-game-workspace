import 'package:flutter/material.dart';
import 'package:game_workspace/providers/bird_fluffy_provider.dart';
import 'package:provider/provider.dart';


class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<BirdFluffyProvider>();

    return Expanded(
        flex: 1,
        child: Container(
            color: Colors.blue[300],
            child: Center(
                child: game.gameStarted
                    ? Column(children: [
                        Text('점수 : ${game.score}',
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "시간 : ${game.remainingTime.toStringAsFixed(1)}초",
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white)),
                            const SizedBox(width: 30),
                            Text("목표 : ${game.targetScore}점",
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white)),
                          ],
                        )
                      ])
                    : const Text(
                        "탭하여 시작",
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ))));
  }
}
