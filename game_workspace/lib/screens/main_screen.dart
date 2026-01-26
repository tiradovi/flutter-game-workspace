import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_workspace/models/game_item.dart';
import 'package:game_workspace/services/game_service.dart';
import 'package:go_router/go_router.dart';

import '../widgets/game_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 게임 목록 데이터 추가
    final List<GameItem> games = GameService.getAllGames();
    return Scaffold(
      appBar: AppBar(
        title: const Text("판타지오 게임나라"),
      ),
      body: Container(
        // 그래디언트 = background-image
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF9fFA4C), Color(0xFFB3CDD1)])),
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(height: 40),
            const Text('Game Hub'),
            const SizedBox(
              height: 8,
            ),
            const Text('플레이할 게임을 선택하세요.'),
            const SizedBox(height: 40),
            Expanded(
                child: GridView.builder(
                    // 그리드 모형
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // 한 줄에 몇 개의 아이템을 배치할지 결정
                            crossAxisSpacing: 16, // 가로 간격 좌우 아이템 사이의 간격
                            mainAxisSpacing: 16),
                    // 세로 간격 위 아래 아이템 사이의 간격 16픽셀 간격
                    itemCount: games.length,
                    //Grid 를 사용할 때 총 grid로 담아야하는 아이템 총 개수를 지정해주지 않으면 그리드는 무한적으로 생성
                    // 데이터가 없는 Grid까지 생성

                    // 각 그리드 컬럼마다 데이터를 index 순서대로 하나씩 GameCard 형태로 담아서 만듦
                    itemBuilder: (context, index) =>
                        GameCard(game: games[index])))
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push("/chat"),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }
}
