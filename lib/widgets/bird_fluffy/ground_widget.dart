import 'package:flutter/material.dart';
import 'package:game_workspace/constants/game_assets.dart';

class GroundWidget extends StatefulWidget {
  const GroundWidget({super.key});

  @override
  State<GroundWidget> createState() => _GroundWidgetState();
}

class _GroundWidgetState extends State<GroundWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final groundHeight = 120.0;

    return SizedBox(
      height: groundHeight,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final dx = -_controller.value * screenWidth;

          return Stack(
            children: [
              Transform.translate(
                offset: Offset(dx, 0),
                child: Image.asset(
                  GameAssets.birdFluffyGround,
                  width: screenWidth,
                  height: groundHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Transform.translate(
                offset: Offset(dx + screenWidth, 0),
                child: Image.asset(
                  GameAssets.birdFluffyGround,
                  width: screenWidth,
                  height: groundHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
