import 'package:flutter/material.dart';
import 'package:game_workspace/constants/game_assets.dart';
import 'package:game_workspace/models/clothing_item.dart';

class CharacterWidget extends StatelessWidget {
  final List<ClothingItem?> equipped;

  const CharacterWidget({super.key, required this.equipped});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          if (equipped[5] != null) _buildBack(),
          if (equipped[2] != null) _buildWep(),
          if (equipped[4] != null) _buildAcc(),
          _buildBody(),
          if (equipped[0] != null) _buildHair(),
          if (equipped[1] != null) _buildTop(),
          if (equipped[3] != null) _buildShoes(),
        ],
      ),
    );
  }

  // 옷입히기나 캐릭터 세팅의 경우 포지션으로 위치를 명확하게 잡아주어야 함

  // 몸통
  Widget _buildBody() {
    return Positioned(
        child: Image.asset(
      GameAssets.dressUpBody,
      width: 400,
      height: 400,
      fit: BoxFit.cover,
    ));
  }

  // 머리
  Widget _buildHead() {
    return Positioned(
        top: 40,
        left: 50,
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
              color: Color(0xFFFFDBAC), shape: BoxShape.circle),
        ));
  }

  // 헤어
  Widget _buildHair() {
    return Positioned(
      left: 20,
      top: -10,
      child: Image.asset(
        equipped[0]!.imageAsset,
        width: 380,
        height: 400,
        fit: BoxFit.contain,
      ),
    );
  }

  // 상의
  Widget _buildTop() {
    return Positioned(
        child: Image.asset(
      equipped[1]!.imageAsset,
      width: 400,
      height: 400,
      fit: BoxFit.cover,
    ));
  }

  // 하의
  Widget _buildWep() {
    return Positioned(
        child: Image.asset(
      equipped[2]!.imageAsset,
      width: 400,
      height: 400,
      fit: BoxFit.contain,
    ));
  }

  // 신발
  Widget _buildShoes() {
    return Positioned(
        child: Image.asset(
      equipped[3]!.imageAsset,
      width: 400,
      height: 400,
      fit: BoxFit.contain,
    ));
  }

  // 악세사리
  Widget _buildAcc() {
    return Positioned(
        child: Image.asset(
      equipped[4]!.imageAsset,
      width: 400,
      height: 400,
      fit: BoxFit.cover,
    ));
  }

  // 배경
  Widget _buildBack() {
    return Positioned(
        child: Image.asset(
      equipped[5]!.imageAsset,
      width: 400,
      height: 400,
      fit: BoxFit.contain,
    ));
  }
}
