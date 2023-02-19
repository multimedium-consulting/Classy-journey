import 'package:classy/core/errors/errors.dart';
import 'package:classy/src/subjects/subject.dart';
import 'package:dartz/dartz.dart';

abstract class ISubjectRepository {
  //Returns a stream of either a failure or a list of subjects from the database
  Either<Failure, Stream<List<Subject>>> getSubjects();
  //Returns a stream of either a failure or a subject from the database
  Either<Failure, Stream<Subject?>> getSubject(int id);
  //Returns a future of either a failure or a unit
  Future<Either<Failure, Unit>> createSubject(Subject subject);

  Future<Either<Failure, Unit>> updateSubject(Subject subject);

  Future<Either<Failure, Unit>> deleteSubject(int id);
}
