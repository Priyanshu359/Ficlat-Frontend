import 'app_exception.dart';

class ErrorHandler {
  static String handleError(Exception e) {
    if (e is NetworkException) {
      return e.message;
    } else if (e is BadRequestException) {
      return e.message;
    } else if (e is UnauthorizedException) {
      return "You are not authorized.";
    } else if (e is NotFoundException) {
      return "Requested resource not found.";
    } else if (e is ServerException) {
      return "Something went wrong on our end.";
    }
    return "Unexpected error occurred.";
  }
}
