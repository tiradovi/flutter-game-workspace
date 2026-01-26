import 'package:flutter/cupertino.dart';

import 'background_widget.dart';
import 'barrier_widget.dart';
import 'bird_widget.dart';
import 'game_over_listener.dart';

class GameArea extends StatelessWidget {
  const GameArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 4,
      child: Stack(
        children: [
          BackgroundWidget(),
          BirdWidget(),
          BarrierWidget(),
          GameOverListener(),
        ],
      ),
    );
  }
}
