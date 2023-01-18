// ignore_for_file: constant_identifier_names

class ApiConstant {
  ApiConstant._();
  static const String BASE_URL = "http://ask.api.kreazy.me/api";
  static const String getPost = "$BASE_URL/post/get";
  static const String register = "$BASE_URL/user/register";
  static const String login = "$BASE_URL/user/login";
  static const String createPost = "$BASE_URL/post/create";
  static const String getComment = "$BASE_URL/post/comment";
}
