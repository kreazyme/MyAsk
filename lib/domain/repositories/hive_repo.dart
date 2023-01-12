abstract class HiveRepository {
  Future<void> setToken(String token);

  Future<String> getToken();

  Future deleteToken();

  Future init();
}
