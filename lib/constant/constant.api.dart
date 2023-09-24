class ConstantApi {
  ConstantApi();

  static const Duration connectTimeout = Duration(milliseconds: 20000);
  static const int defaultMaxAttemptsAPI = 2;

  /// url stuff
  static const String apiBaseUrl = 'www.boredapi.com';
  static const String activity = '/api/activity';
}