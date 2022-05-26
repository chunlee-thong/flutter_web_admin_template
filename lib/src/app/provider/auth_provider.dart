class AuthProvider {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
  }
}
