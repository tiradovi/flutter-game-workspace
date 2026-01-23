import 'dart:ui';

import 'package:flutter/cupertino.dart';

class GameItem {
  final String id;
  final String name;
  final Color color;

  // final IconData icon;
  final IconData? icon;
  final String? imageAsset;

  GameItem(
      {required this.id,
        required this.name,
        required this.color,
        // required this.icon, -> final IconData icon;
        this.icon, // final IconData? icon; 선택사항 으로 데이터를 넣어주는 변수공간
        // undefined 가 생길 수 있기 때문에 null 상태는 명시적으로 null 처리
        this.imageAsset}); // 기본적으로 null 상태
}