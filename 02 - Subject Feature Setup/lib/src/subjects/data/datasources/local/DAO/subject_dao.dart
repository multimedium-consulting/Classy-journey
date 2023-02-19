import 'package:classy/config/config.dart';
import 'package:classy/src/subjects/subject.dart';
import 'package:floor/floor.dart';

@dao
abstract class SubjectDao {
  @Query('SELECT * FROM $kSubjectTableName')
  Stream<List<Subject>> findAllSubjects();

  @Query('SELECT * FROM $kSubjectTableName WHERE id = :id')
  Stream<Subject?> findSubjectById(int id);

  @insert
  Future<void> insertSubject(Subject subject);

  @update
  Future<void> updateSubject(Subject subject);

  @delete
  Future<void> deleteSubject(Subject subject);
}
