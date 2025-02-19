class AuthException implements Exception {
  final String message = "Wrong password or login";

  AuthException();
}
