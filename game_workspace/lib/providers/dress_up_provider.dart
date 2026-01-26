import 'package:flutter/cupertino.dart';
import 'package:game_workspace/models/clothing_item.dart';
import 'package:game_workspace/services/clothing_service.dart';

class DressUpProvider extends ChangeNotifier {
  // 현재 선택된 카테고리 (0:헤어, 1:상의, 2:무기, 3:신발, 4:악세사리, 5: 배경)
  int category = 0;

  // 장착된 아이템들 정렬해놓는 리스트 공간 생성
  // 처음에는 장착된 아이템들이 존재하지 않는다는 가정일 경우 모두 null값으로 채우기
  //                          [헤어,상의,하의,신발,악세사리]
  List<ClothingItem?> equipped = [null, null, null, null, null,null];

  // 현재 카테고리의 아이템 목록
  // Dart 언어에서 List 와 같은 컬렉션을 다룰 때 사용하는 함수형 프로그래밍 문법
  // 조건에 맞는 요소만 걸러내는 과정 filter
  // List = 목록에서 조건에 맞는 것만 골라서 -> 다시 목록으로 만들자~
  List<ClothingItem> get items {
    return ClothingService.items
    // ClothingService 에는 헤어 상의 하의 신발 악세사리 카테고리가 존재하고, 카테고리마다 데이터가 존재
    // 소비자가 만약에 헤어를 선택하면 헤어 카테고리에 해당하는 모든 데이터만 items으로 가져가기
        .where(// filter 역할
      // 리스트에 있는 요소를 하나씩 꺼내서 item 이라는 이름으로 잠시 데이터를 담아두겠다.
            (item) =>
        item.type ==
            category // item에 담겨있는 type 이 내가 원하는 category와 같습니까?
    )
        .toList(); // 모두 필터처리되어 걸러진 아이템들을 다시 목록 리스트 형태로 변환
  }

  // 카테고리 선택
  void selectCategory(int type) {
    category = type;
    notifyListeners();
  }

  // equipped = 장비 갖추게 하는 / 구비된
  // 아이템 착용
  void selectItem(ClothingItem item) {
    equipped[item.type] = item;
    notifyListeners();
  }

  // 현재 카테고리 아이템 해제
  void removeItem() {
    equipped[category] = null;
    notifyListeners();
  }

  // 모든 아이템 초기화
  void reset() {
    equipped = [null, null, null, null, null];
    notifyListeners(); //초기화 끝냈대요 ^^~
  }

  // 아이템 착용 중인지 확인
  bool isEquipped(ClothingItem item) {
    return equipped[item.type]?.id == item.id;
  }
}