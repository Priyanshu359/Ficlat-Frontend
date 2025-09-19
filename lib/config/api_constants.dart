class ApiConstants {
  static const String baseUrl = "http://10.0.2.2:5000"; // change when backend ready

  // Auth Endpoints
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  static const String logout = "$baseUrl/auth/logout";
  static const String refreshToken = "$baseUrl/auth/refresh-token";
}