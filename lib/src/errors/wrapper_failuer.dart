abstract class WrapperFailure implements Exception {
  String? errorMessage;
  WrapperFailure(this.errorMessage);

  String? get messageError => errorMessage;
}

class ClientError extends WrapperFailure {
  final int messageCode;

  ClientError(this.messageCode, super.errorMessage);
}

class ServerError extends WrapperFailure {
  final int messageCode;

  ServerError(this.messageCode, super.errorMessage);
}
