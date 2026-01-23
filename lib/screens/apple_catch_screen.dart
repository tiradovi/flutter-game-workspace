import 'package:flutter/material.dart';
import 'package:game_workspace/models/game_item.dart';
import 'package:game_workspace/providers/apple_catch_provider.dart';
import 'package:game_workspace/widgets/apple_catch/basket_widget.dart';
import 'package:game_workspace/widgets/apple_catch/falling_item_widget.dart';
import 'package:provider/provider.dart';

class AppleCatchScreen extends StatelessWidget {
  final String gameId;
  final GameItem? gameItem;

  const AppleCatchScreen({
    super.key,
    required this.gameId,
    this.gameItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사과받기'),
        backgroundColor: Colors.green,
        actions: [
          // TODO: Consumer로 점수, 레벨, 놓친 개수 표시
          Consumer<AppleCatchProvider>(
            builder: (context, provider, child) {
              return Row(
                children: [
                  Text('점수: ${provider.score}  '),
                  Text('레벨: ${provider.level}  '),
                  Text('놓침: ${provider.missedApples}  '),
                ],
              );
            },
          ),
          // TODO: 리셋 버튼
          IconButton(
            onPressed: () {
              // context.read<AppleCatchProvider>().resetGame();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Consumer<AppleCatchProvider>(
        builder: (context, provider, child) {
          return GestureDetector(
            onPanUpdate: (details) {
              // TODO: 터치 좌표를 바구니 좌표로 변환
              // final screenWidth = MediaQuery.of(context).size.width;
              // final newX = ((details.localPosition.dx - screenWidth / 2) / 150);
              // provider.moveBasket(newX);
            },
            child: Container(
              color: Color(0xFFE3F2FD),
              child: Stack(
                children: [
                  // TODO: 게임 시작 전 화면
                  if (!provider.gameStarted)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // provider.startGame();
                        },
                        child: Text('탭하여 시작'),
                      ),
                    ),

                  // TODO: 게임 진행 중 화면
                  if (provider.gameStarted) ...[
                    // 떨어지는 아이템들 표시
                    // ...provider.items.map((item) =>
                    //   FallingItemWidget(item: item)
                    // ),

                    // 바구니 표시
                    // BasketWidget(x: provider.basketX),
                  ],

                  // TODO: 게임오버 화면
                  // if (provider.missedApples >= provider.maxMissed && !provider.gameStarted)
                  //   Center(
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text('게임 오버!', style: TextStyle(fontSize: 40)),
                  //         Text('최종 점수: ${provider.score}'),
                  //         ElevatedButton(
                  //           onPressed: () => provider.resetGame(),
                  //           child: Text('다시 시작'),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
