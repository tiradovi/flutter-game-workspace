import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_workspace/models/game_item.dart';
import 'package:game_workspace/providers/dress_up_provider.dart';
import 'package:game_workspace/widgets/dress_up/character_widget.dart';
import 'package:provider/provider.dart';

/*
models
└─ clothing_item.dart

services
└─ clothing_service.dart

provider
└─ dress_up_provider.dart

widgets/dress_up
└─ character_widget

screen
└─ dress_up_screen
 */
class DressUpScreen extends StatelessWidget {
  final String gameId;
  final GameItem? gameItem;

  const DressUpScreen({super.key, required this.gameId, this.gameItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('옷입히기'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
              onPressed: () {
                context.read<DressUpProvider>().reset();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Consumer<DressUpProvider>(
        builder: (context, provider, child) {
          final categories = ['헤어', '상의', '하의', '신발', '악세', '배경'];
          return Column(
            children: [
              // 캐릭터 영역
              Expanded(
                  child: Container(
                color: Color(0xFFFFF0F5),
                child: Center(
                  child: CharacterWidget(equipped: provider.equipped),
                ),
              )),
              // 카테고리 버튼
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 카테고리 버튼 헤어
                    for (int i = 0; i < categories.length; i++)
                      _categoryButton(provider, i, categories[i]),
                  ],
                ),
              ),

              // 해제 버튼

              // 아이템 그리드 (아이템 창)
              _buildItemGrid(provider)
            ],
          );
        },
      ),
    );
  }

  // 카테고리 버튼 추후 widgets/dress_up 으로 분리
  Widget _categoryButton(DressUpProvider provider, int index, String label) {
    final selected = provider.category == index;

    return GestureDetector(
      onTap: () => provider.selectCategory(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: selected ? Colors.pink : Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          label,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  // 아이템 창 아이템 선택 해제가 가능한 창
  Widget _buildItemGrid(DressUpProvider provider) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemCount: provider.items.length,
            itemBuilder: (context, index) {
              final item = provider.items[index];
              final selected = provider.isEquipped(item);

              return GestureDetector(
                onTap: () => selected
                    ? provider.removeItem()
                    : provider.selectItem(item),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: selected ? Colors.pink : Colors.grey.shade300,
                          width: selected ? 3 : 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item.imageAsset,
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 16),
                      Text(item.name)
                    ],
                  ),
                ),
              );
            }));
  }
}
