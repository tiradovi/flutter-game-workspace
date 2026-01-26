import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_workspace/constants/game_assets.dart';
import 'package:game_workspace/models/clothing_item.dart';

class ClothingService {
  static final List<ClothingItem> items = [
    // 0:헤어 1:상의 2:무기 3:신발 4:악세사리
    // 헤어 (type: 0)
    // ClothingItem(id: id, name: name, type: type, color: color)
    ClothingItem('h1', '짧은머리', 0, GameAssets.dressUpHat1),
    ClothingItem('h2', '긴머리', 0,  GameAssets.dressUpHat1),
    ClothingItem('h3', '금발머리', 0,  GameAssets.dressUpHat1),

    // 상의 (type: 1)
    ClothingItem('t1', '티셔츠', 1, GameAssets.dressUpClothes1),
    ClothingItem('t2', '후드티', 1,  GameAssets.dressUpClothes1),
    ClothingItem('t3', '긴팔티셔츠', 1,  GameAssets.dressUpClothes1),

    // 무기 (type: 2)
    ClothingItem('w1', '무기', 2, GameAssets.dressUpWep1),

    // 신발 (type: 3)
    ClothingItem('s1', '신발', 3,  GameAssets.dressUpShoes1),

    // 악세사리 (type: 4)
    ClothingItem('a1', '가방', 4,  GameAssets.dressUpAcc1),

    // 배경 (type : 5)
    ClothingItem('b1', '배경1', 5,  GameAssets.dressUpBack1),


  ];
}