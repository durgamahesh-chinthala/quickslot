/// Minimal anonymous login controller for QuickSlot MVP.
class AnonymousLoginController {
  static final AnonymousLoginController _instance =
      AnonymousLoginController._internal();
  AnonymousLoginController._internal();
  factory AnonymousLoginController() => _instance;

  /// Returns true for a successful anonymous login placeholder.
  Future<bool> getAnonymousLoginStatus() async {
    return true;
  }
}
