import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static final String? apiKey = dotenv.env['GOOGLE_API_KEY'];
  static const String apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent";


  static Future<String> AIsendMessage(
      String message, List<Map<String, String>> conversationHistory) async {
    try {
      // 대화 히스토리를 API 형식으로 변환
      final List<Map<String, dynamic>> contents = [];

      // 이전 대화 추가
      for (var msg in conversationHistory) {
        contents.add({
          'role': msg['isUser'] == 'true' ? 'user' : 'model',
          'parts': [
            {'text': msg['message']}
          ]
        });
      }

      // 현재 메세지
      contents.add({
        'role': 'user',
        'parts': [
          {'text': message}
        ]
      });
      final response = await http.post(Uri.parse('$apiUrl?key=$apiKey'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'contents': contents,
            'generationConfig': {
              'temperature': 0.7,
              'maxOutputTokens': 1000,
            }
          }));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        throw Exception('API 오류 : ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('메세지 전송 실패 : $e');
    }
  }
}
/*  백엔드 연결하여 챗봇 서비스 제공
// Dio 인스턴스 생성
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.chatUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<ChatResponse> sendMessage(ChatRequest request) async {
    final res = await _dio.post(
      ApiConstants.message,
      data: request.toJson(),
    );


    if (res.statusCode == 200) {
      return ChatResponse.fromJson(res.data);
    } else {
      throw Exception(ErrorMessages.serverError);
    }
  }*/
