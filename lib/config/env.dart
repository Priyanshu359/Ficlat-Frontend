class Env{
  static const String environment = "development";

  static String get baseUrl {
    if(environment == "production") {
      return "https://api.ficlat.com";
    }
    return "http://10.0.2.2:5000";  // Emulator Localhost
  }
}