// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SubjectDao? _subjectDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `subject_table` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SubjectDao get subjectDao {
    return _subjectDaoInstance ??= _$SubjectDao(database, changeListener);
  }
}

class _$SubjectDao extends SubjectDao {
  _$SubjectDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _subjectInsertionAdapter = InsertionAdapter(
            database,
            'subject_table',
            (Subject item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _subjectUpdateAdapter = UpdateAdapter(
            database,
            'subject_table',
            ['id'],
            (Subject item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _subjectDeletionAdapter = DeletionAdapter(
            database,
            'subject_table',
            ['id'],
            (Subject item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Subject> _subjectInsertionAdapter;

  final UpdateAdapter<Subject> _subjectUpdateAdapter;

  final DeletionAdapter<Subject> _subjectDeletionAdapter;

  @override
  Stream<List<Subject>> findAllSubjects() {
    return _queryAdapter.queryListStream('SELECT * FROM subject_table',
        mapper: (Map<String, Object?> row) =>
            Subject(id: row['id'] as int?, name: row['name'] as String),
        queryableName: 'subject_table',
        isView: false);
  }

  @override
  Stream<Subject?> findSubjectById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM subject_table WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Subject(id: row['id'] as int?, name: row['name'] as String),
        arguments: [id],
        queryableName: 'subject_table',
        isView: false);
  }

  @override
  Future<void> insertSubject(Subject subject) async {
    await _subjectInsertionAdapter.insert(subject, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSubject(Subject subject) async {
    await _subjectUpdateAdapter.update(subject, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSubject(Subject subject) async {
    await _subjectDeletionAdapter.delete(subject);
  }
}
