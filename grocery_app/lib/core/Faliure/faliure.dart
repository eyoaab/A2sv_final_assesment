abstract class Failure {
  final String message;

  const Failure(this.message);
}


class NetworkFailure extends Failure {
  const NetworkFailure() : super("Network failure. Please check your internet connection.");
}

class ServerFailure extends Failure {
  const ServerFailure() : super("Server failure. Please try again later.");
}

class DataParsingFailure extends Failure {
  const DataParsingFailure() : super("Data parsing failure. Unexpected data format.");
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super("Connection failure");
}