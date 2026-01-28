import 'package:dio/dio.dart';
import 'package:game_workspace/common/constants.dart';
import 'package:game_workspace/models/user.dart';

class UserService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<List<User>> getAllUsers() async {
    try {
      final response = await _dio.get("/users");
      final List<dynamic> data = response.data;

      return data.map((json) => User.fromJson(json)).toList();
    } catch (e){
      print("사용자 목록 조회 실패 : $e");
      throw Exception("사용자 목록 가져오기 실패");
    }
  }
    static Future<User?> getUserById(String userId) async {
    try {
      final response = await _dio.get("/users/$userId");

      return User.fromJson(response.data);
    } catch (e){
      print("특정 사용자 조회 실패 : $e");
      throw Exception("특정 사용자 가져오기 실패");
    }
  }


}