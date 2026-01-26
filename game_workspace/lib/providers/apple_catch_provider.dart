import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game_workspace/models/falling_item.dart';

class AppleCatchProvider extends ChangeNotifier {
  // ============= 게임 상태 변수들 =============

  // 바구니 위치 (가로)
  double basketX = 0.0;

  //떨어지는 아이템 리스트
  List<FallingItem> items = [];

  // 게임 상태
  bool gameStarted = false;
  int score = 0;
  int missedApples = 0; // 놓친 사과 개수
  final int maxMissed = 3; // 최대 놓칠 수 있는 개수

  //  난이도 관련
  int level = 1;
  double spawnInterval = 2.0; // 아이템 생성 간격(초)

  //  타이머 객체들
  Timer? _gameTimer;
  Timer? _spawnTimer;

  // 추가 변수들 (필요시)

  // ============= 메서드들 =============

  // 게임 시작 메서드
  void startGame() {
    // gameStarted를 true로 설정
    gameStarted = true;
    _gameTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      _updateGame();
    });
    _spawnTimer = Timer.periodic(
      Duration(milliseconds: (spawnInterval * 1000).toInt()),
          (timer) {
        _spawnItem();
      },
    );
  }

  // 게임 업데이트 메서드 (타이머마다 호출)
  void _updateGame() {
    // 모든 아이템의 y 위치 증가
    items.forEach((item) {
      item.y += item.speed;
    });

    // 화면 밖으로 나간 아이템 처리
    items.removeWhere((item) {
      if (item.y > 1.0) {
        if (item.isGood) {
          missedApples++;
        }
        return true; // 제거
      }
      return false;
    });


    // 충돌 체크
     _checkCollision();

    // 게임 오버 체크
    if (_checkGameOver()) {
      stopGame();
      return;
    }


    // 레벨업 체크 (50점마다)
    if (score ~/ 50 + 1 > level) {
      level++;
      spawnInterval = max(0.6, spawnInterval - 0.2);
    }

    notifyListeners();
  }

  //  아이템 생성 메서드
  void _spawnItem() {
     final random = Random();
     final isApple = random.nextDouble() < 0.7;

    // 새로운 FallingItem 생성
     final newItem = FallingItem(
       id: 'item_${DateTime.now().millisecondsSinceEpoch}',
       emoji: isApple ? '🍎' : '💣',
       isGood: isApple,
       x: random.nextDouble() *1.6 -0.8,
       y: -1.0,
       speed: 0.02 * level,
     );

     items.add(newItem);
  }

  //  바구니 이동 메서드
  void moveBasket(double newX) {
    basketX = newX.clamp(-0.9, 0.9);
    notifyListeners();
  }

  //  충돌 감지 메서드
  void _checkCollision() {
     items.removeWhere((item) {
      final inBasketX = (item.x - basketX).abs() < 0.15;
       final inBasketY = item.y > 0.8 && item.y < 1.0;

       if (inBasketX && inBasketY) {

         return true; // 아이템 제거
       }
       return false;
     });
  }

  //  게임오버 체크 메서드
  bool _checkGameOver() {
    return missedApples >= maxMissed;
  }

  //  게임 중지 메서드
  void stopGame() {
    _gameTimer?.cancel();
    _spawnTimer?.cancel();
    gameStarted = false;
    notifyListeners();
  }

  //  게임 리셋 메서드
  void resetGame() {
    // 모든 변수를 초기값으로
    basketX = 0.0;
    gameStarted = false;
    score = 0;
    missedApples = 0;
    level = 1;
    spawnInterval = 2.0;

    items.clear();
    notifyListeners();
  }
}
