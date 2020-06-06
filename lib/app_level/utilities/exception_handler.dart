class _CustomException implements Exception {
  final String prefix;
  final String message;

  _CustomException(
    this.prefix,
    this.message,
  );

  @override
  String toString() => '$prefix....$message';
}

class FetchDataException extends _CustomException {
  FetchDataException([String message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends _CustomException {
  BadRequestException([String message]) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends _CustomException {
  UnauthorisedException([String message]) : super(message, 'Unauthorised: ');
}

class InvalidInputException extends _CustomException {
  InvalidInputException([String message]) : super(message, 'Invalid Input: ');
}
