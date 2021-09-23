class HttpException implements Exception {
  String cause;

  HttpException(this.cause);
}
