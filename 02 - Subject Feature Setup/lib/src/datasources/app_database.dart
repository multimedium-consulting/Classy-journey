import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:classy/src/subjects/subject.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Subject])
abstract class AppDatabase extends FloorDatabase {
  SubjectDao get subjectDao;
}
