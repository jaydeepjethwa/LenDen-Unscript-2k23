class AppException implements Exception {
  final String message;
  final String prefix;
  final String url;

  AppException(this.message, this.prefix, this.url);
}

class BadRequestException extends AppException {
  BadRequestException(String message, String url)
      : super(message, "Bad request", url);
}

class FetchDataException extends AppException {
  FetchDataException(String message, String url)
      : super(message, "Unable to process request", url);
}

class ApiNotrespondingException extends AppException {
  ApiNotrespondingException(String message, String url)
      : super(message, "Api not responding", url);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String message, String url)
      : super(message, "Unauthorized Request", url);
}