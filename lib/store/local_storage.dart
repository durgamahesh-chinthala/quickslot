class LocalStorage {
  static final Map<String, dynamic> _store = {};

  static Future<void> setString(String key, String value) async {
    _store[key] = value;
  }

  static String? getString(String key) {
    final v = _store[key];
    return v is String ? v : null;
  }

  static Future<void> clear() async {
    _store.clear();
  }

  // App-specific helpers used by network layer
  static Future<String?> getLoggedInUser() async => getString('logged_in_user');
  static Future<String?> getUserName() async => getString('username');
  static Future<String?> getPassword() async => getString('password');
  static Future<String?> getCookie() async => getString('cookie');
  static Future<String?> getAuthorization() async => getString('authorization');
  static Future<String?> getJwtToken() async => getString('jwt_token');

  static Future<void> setAuthorization(String value) async =>
      setString('authorization', value);
  static Future<void> setJwtToken(String value) async =>
      setString('jwt_token', value);
  static Future<void> setCookie(String value) async =>
      setString('cookie', value);
  static Future<void> setKeyValue(String key, String value) async =>
      setString(key, value);
  static Future<void> setKeyMethod(String key, String value) async =>
      setString(key, value);
}
