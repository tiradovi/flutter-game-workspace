class ChatRequest {
  final String userId;
  final String message;
  final int? conversationId;

  ChatRequest(this.userId, this.message, [this.conversationId]);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'message': message,
        'conversationId': conversationId,
      };
}
