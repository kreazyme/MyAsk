// ignore_for_file: constant_identifier_names

class ApiConstant {
  static const String BASE_URL = "http://ask.api.kreazy.me/api";
  static String getPost = "$BASE_URL/post/get?page=1&perPage=1";
  static String register = "$BASE_URL/user/register";
  static String login = "$BASE_URL/user/login";
  static String createPost = "$BASE_URL/post/create";
}
