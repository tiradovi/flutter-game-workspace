class ApiConstants {
  static const String baseUrl='http://localhost:8080/api';
  static const String chatUrl = '$baseUrl/chat';
  static const String message='/message';
}

class AppConstants {
  static const maxContentLength=255;
}
class ErrorMessages {
  static const networkError='네트워크 연결을 확인해주세요.';
  static const serverError='서버 오류가 발생했습니다.';
  static const loadFailed='목록을 불러오는데 실패했습니다.';
  static const createFailed='생성에 실패했습니다.';
  static const deleteFailed='삭제에 실패했습니다.';
  static const emptyContent='내용을 입력해주세요.';
}

class DialogMessages {
  static const deleteTitle='삭제';
  static const deleteContent='정말로  삭제하시겠습니까?';
  static const cancel='취소';
  static const delete='삭제';
  static const add='추가';
}