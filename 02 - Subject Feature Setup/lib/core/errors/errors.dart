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

class DatabaseFailure extends Failure {
  const DatabaseFailure({String? errorMessage})
      : super(errorMessage: errorMessage);
}
