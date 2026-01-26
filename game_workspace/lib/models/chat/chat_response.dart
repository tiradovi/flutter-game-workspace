class ChatResponse {
  final int conversationId;
  final String message;

  ChatResponse(this.conversationId, this.message);

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      ChatResponse(json['conversationId'], json['message']);
}
