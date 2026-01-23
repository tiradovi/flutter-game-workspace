import 'package:flutter/material.dart';

import '../../constants/game_assets.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({super.key});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
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

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final dx = -_controller.value * screenWidth;

        return Stack(
          children: [
            Transform.translate(
              offset: Offset(dx, 0),
              child: Image.asset(
                GameAssets.birdFluffyBackground,
                width: screenWidth,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Transform.translate(
              offset: Offset(dx + screenWidth, 0),
              child: Image.asset(
                GameAssets.birdFluffyBackground,
                width: screenWidth,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ],
        );
      },
    );
  }
}
