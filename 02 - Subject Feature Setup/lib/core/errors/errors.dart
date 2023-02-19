abstract class Failure {
  final String? errorMessage;

  const Failure({required this.errorMessage});
}

class CacheFailure extends Failure {
  const CacheFailure({String? errorMessage})
      : super(errorMessage: errorMessage);
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({String? errorMessage})
      : super(errorMessage: errorMessage);
}

class DBFailure extends Failure {
  const DBFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}
