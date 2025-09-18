import 'package:ficlat_frontend/config/app_config.dart';

class Logger {
  static void log(String message) {
    if (AppConfig.isDebug ?? false) {
      // ignore: avoid_print
      print("LOG: $message");
    }
  }

  static void error(String message) {
    if (AppConfig.isDebug ?? false) {
      // ignore: avoid_print
      print("ERROR: $message");
    }
  }
}
