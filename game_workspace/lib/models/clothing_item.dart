import 'dart:ui';

class ClothingItem {
  final String id;
  final String name;
  final int type; // 0:헤어 1:상의 2:무기 3:신발 4:악세사리 5:배경
  final String imageAsset;

  ClothingItem(this.id, this.name, this.type, this.imageAsset);
}
