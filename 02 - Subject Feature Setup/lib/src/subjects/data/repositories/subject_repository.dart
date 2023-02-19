import 'package:classy/core/errors/errors.dart';
import 'package:classy/src/datasources/app_database.dart';
import 'package:classy/src/subjects/subject.dart';
import 'package:dartz/dartz.dart';

class SubjectRepository extends ISubjectRepository {
  final AppDatabase _database;

  SubjectRepository(this._database);

  @override
  Future<Either<Failure, Unit>> createSubject(Subject subject) async {
    try {
      await _database.subjectDao.insertSubject(subject);
      return const Right(unit);
    } on Exception {
      return const Left(
          DatabaseFailure(errorMessage: "Error creating subject"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteSubject(int id) async {
    try {
      await _database.subjectDao.deleteSubject(Subject(id: id, name: ''));
      return const Right(unit);
    } on Exception {
      return const Left(
          DatabaseFailure(errorMessage: "Error deleting subject"));
    }
  }

  @override
  Either<Failure, Stream<Subject?>> getSubject(int id) {
    try {
      final subject = _database.subjectDao.findSubjectById(id);
      return Right(subject);
    } on Exception {
      return const Left(DatabaseFailure(errorMessage: "Error getting subject"));
    }
  }

  @override
  Either<Failure, Stream<List<Subject>>> getSubjects() {
    try {
      final subjects = _database.subjectDao.findAllSubjects();
      return Right(subjects);
    } on Exception {
      return const Left(
          DatabaseFailure(errorMessage: "Error getting subjects"));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateSubject(Subject subject) async {
    try {
      await _database.subjectDao.updateSubject(subject);
      return const Right(unit);
    } on Exception {
      return const Left(
          DatabaseFailure(errorMessage: "Error updating subject"));
    }
  }
}
