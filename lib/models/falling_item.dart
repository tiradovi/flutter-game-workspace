class FallingItem {
  final String id; // 아이템 고유 식별자
  final String emoji; // 표시할 이모지 (🍎 또는 💣)
  final bool isGood; // true: 사과, false: 폭탄
  double x; // 가로 위치 (-1.0 ~ 1.0)
  double y; // 세로 위치 (-1.0 ~ 1.0)
  final double speed; // 떨어지는 속도

  FallingItem(
      {required this.id,
      required this.emoji,
      required this.isGood,
      required this.x,
      required this.y,
      required this.speed});
}
