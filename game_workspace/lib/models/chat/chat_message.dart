class ChatMessage {
  final String message;
  final bool isUser;
  final DateTime time;

  // this.변수이름  vs 변수이름은 다른 의미
  // 기존 변수에 값을 넣는다 vs 외부에서 데이터를 받아오는 공간 명칭
  ChatMessage(this.message, this.isUser, this.time);


}
