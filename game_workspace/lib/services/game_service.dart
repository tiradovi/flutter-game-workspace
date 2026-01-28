import 'package:flutter/material.dart';
import 'package:game_workspace/constants/game_assets.dart';
import 'package:game_workspace/models/game_item.dart';

class GameService {
  static List<GameItem> getAllGames(){
    return [
      GameItem(id: 'flappy',
          name: '충돌피하기',
          color: Colors.blue,
          imageAsset: GameAssets.birdFluffyFlyBird
      ),
      GameItem(id: 'dressUp',
          name: '옷입히기',
          color: Colors.red,
          imageAsset: GameAssets.dressUpLogo
      ),
      GameItem(
        id: 'appleCatch',
        name: '사과받기',
        color: Colors.green.shade700,
        icon: Icons.catching_pokemon,
      ),
      GameItem(id: 'calendar',
          name: '캘린더',
          color: Colors.purple,
          icon: Icons.calendar_month
      ),
      GameItem(id: 'user',
          name: '유저',
          color: Colors.grey,
          icon: Icons.person
      ),
      GameItem(id: 'arcade',
          name: '아케이드',
          color: Colors.green,
          icon: Icons.sports_esports
      ),
      GameItem(id: 'adventure',
          name: '어드벤처',
          color: Colors.pink,
          icon: Icons.explore
      ),
    ];
  }

  static GameItem? getGameById(String id) {
    return getAllGames().firstWhere((game) => game.id == id);
  }
}