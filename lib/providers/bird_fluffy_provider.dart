import 'dart:async';

import 'package:flutter/cupertino.dart';

class BirdFluffyProvider with ChangeNotifier {
  // 새 y축 위치
  double birdY = 0;

  // 중력 계산을 위한 시간 변수 (초 단위)
  double time = 0;

  // 높이
  double height = 0;

  // 새의 현재 높이
  double initialHeight = 0;

  // 게임 시작 여부(true: 게임 진행 중, false: 대기 중)
  bool gameStarted = false;

  // 현재 점수(장애물 통과시 1씩 증가)
  int score = 0;

  // 장애물 위치
  double barrierX = 2.0;

  // 장애물의 높이(픽셀 단위)
  double barrierHeight = 180;

  // 게임 루프를 실행하는 타이머 객체
  Timer? _timer;

  // 화면을 계속 누르고 있는지 여부
  bool isHolding = false;

  // 게임 시작 후 경과 시간 (초)
  double gameTime = 0;

  // 목표 시간 (초) - 시간 도달 시 게임 종료
  double targetTime = 60.0;

  // 목표 점수 - 이 점수에 도달하면 게임 종료
  int targetScore = 20;

  // 장애물 통과 여부 체크 (중복 점수 방지)
  bool hasPassedBarrier = false;

  // 이전 프레임에서 충돌 상태였는가 (중복 감점 방지)
  bool wasColliding = false;

  // 게임 시작 메서드
  void startGame() {
    gameStarted = true;
    gameTime = 0;

    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      gameTime += 0.05;

      // 시간 종료 체크
      if (gameTime >= targetTime) {
        stopGame();
        return;
      }

      // 목표 점수 도달 체크
      if (score >= targetScore) {
        stopGame();
        return;
      }

      // 새의 움직임 처리
      if (isHolding) {
        if (birdY > -0.9) {
          birdY -= 0.03;
        } else {
          birdY = -0.9;
        }
      } else {
        time += 0.04;
        birdY = initialHeight + 4.9 * time * time;
      }

      barrierX -= 0.08;

      if (barrierX < -2) {
        barrierX = 2.5;
        hasPassedBarrier = false;
      }

      if (!hasPassedBarrier && barrierX < 0) {
        if (birdY >= -0.3 && birdY <= 0.3) {
          score++;
        }
        hasPassedBarrier = true;
      }

      _checkCollision();

      if (checkGameOver()) {
        stopGame();
        return;
      }

      notifyListeners();
    });
  }

  // 새를 점프시키는 메서드
  void jump() {
    time = 0;
    initialHeight = birdY;
    notifyListeners();
  }

  // 게임 오버 조건 체크 메서드
  bool checkGameOver() {
    // 화면 밖으로 나갔는지 체크
    if (birdY > 1.0 || birdY < -1.0) {
      return true;
    }
    return false;
  }

  // 충돌 체크 (감점 처리용)
  void _checkCollision() {
    if (barrierX < 0.2 && barrierX >= -0.2) {
      if (birdY < -0.3 || birdY > 0.3) {
        if (!wasColliding) {
          if (score > 0) score--;
          wasColliding = true;
        }
      } else {
        wasColliding = false;
      }
    } else {
      wasColliding = false;
    }
  }

  // 게임 중지 메서드
  void stopGame() {
    _timer?.cancel();
    gameStarted = false;
    isHolding = false;
    notifyListeners();
  }

  // 게임을 처음 상태로 리셋하는 메서드
  void resetGame() {
    birdY = 0;
    time = 0;
    height = 0;
    initialHeight = 0;
    barrierX = 2.0;
    score = 0;
    gameStarted = false;
    isHolding = false;
    gameTime = 0;
    hasPassedBarrier = false;
    wasColliding = false;
    notifyListeners();
  }

  void startHolding() {
    isHolding = true;
    time = 0;
    initialHeight = birdY;
    notifyListeners();
  }

  void stopHolding() {
    isHolding = false;
    time = 0;
    initialHeight = birdY;
    notifyListeners();
  }

  // 남은 시간
  double get remainingTime => targetTime - gameTime;

  // 남은 점수
  int get remainingScore => targetScore - score;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
