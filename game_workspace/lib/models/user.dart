import 'package:freezed_annotation/freezed_annotation.dart';

/**
 * 'user.freezed.dart'
 * -> copyWith == hashCode, toString 과 같은 유틸리티 메서드 자동 생성해서 사용
 *
 * 'user.g.dart'
 * -> models 에서 만들어 사용했던 fromJson, toJson형태의 변환용 model
 * 이 상태로 User.dart을 service나 provider screen widget 등에서 사용하면 된다.
 */
part 'user.freezed.dart';
part 'user.g.dart';
@freezed
// with _$User Mixin : freezed 가 자동 생성한 기능을 사용하겠다.
class User with _$User {
  // const = 상수
  // factory = 객체 생성자
  const factory User(
      {required String userId,
      required String userName,
      required String email,
      String? profileImageUrl,
      DateTime? createAt}) = _User; // = _User 실제 생성되는 클래스의 이름

  // json 변환 기능 만들겠다.                           Json을 User 객체로 변환하는 함수 user.g.dart 자동생성됨
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
/*class User {
  final String userId;
  final String userName;
  final String email;
  final String? profileImageUrl;
  final DateTime? createAt;

  User({required this.userId, required this.userName, required this.email, this.profileImageUrl, this.createAt});
}*/
