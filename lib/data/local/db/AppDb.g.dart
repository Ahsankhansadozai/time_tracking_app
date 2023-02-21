// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDb.dart';

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

  TaskDao? _taskDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `TaskModel` (`taskSerialNo` INTEGER PRIMARY KEY AUTOINCREMENT, `taskName` TEXT, `taskCreatedTime` TEXT, `taskStatus` INTEGER, `timer` INTEGER, `lastTick` INTEGER, `lastUpdated` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskModelInsertionAdapter = InsertionAdapter(
            database,
            'TaskModel',
            (TaskModel item) => <String, Object?>{
                  'taskSerialNo': item.taskSerialNo,
                  'taskName': item.taskName,
                  'taskCreatedTime': item.taskCreatedTime,
                  'taskStatus': item.taskStatus,
                  'timer': item.timer == null ? null : (item.timer! ? 1 : 0),
                  'lastTick': item.lastTick,
                  'lastUpdated': item.lastUpdated
                }),
        _taskModelUpdateAdapter = UpdateAdapter(
            database,
            'TaskModel',
            ['taskSerialNo'],
            (TaskModel item) => <String, Object?>{
                  'taskSerialNo': item.taskSerialNo,
                  'taskName': item.taskName,
                  'taskCreatedTime': item.taskCreatedTime,
                  'taskStatus': item.taskStatus,
                  'timer': item.timer == null ? null : (item.timer! ? 1 : 0),
                  'lastTick': item.lastTick,
                  'lastUpdated': item.lastUpdated
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskModel> _taskModelInsertionAdapter;

  final UpdateAdapter<TaskModel> _taskModelUpdateAdapter;

  @override
  Future<List<TaskModel>> hFindAllTaskWithStatus(String status) async {
    return _queryAdapter.queryList('SELECT * FROM TaskModel WHERE status=?1',
        mapper: (Map<String, Object?> row) => TaskModel(
            taskSerialNo: row['taskSerialNo'] as int?,
            taskName: row['taskName'] as String?,
            taskCreatedTime: row['taskCreatedTime'] as String?,
            taskStatus: row['taskStatus'] as int?,
            timer: row['timer'] == null ? null : (row['timer'] as int) != 0,
            lastTick: row['lastTick'] as int?,
            lastUpdated: row['lastUpdated'] as String?),
        arguments: [status]);
  }

  @override
  Future<List<TaskModel>> hFindAllTask() async {
    return _queryAdapter.queryList('SELECT * FROM TaskModel',
        mapper: (Map<String, Object?> row) => TaskModel(
            taskSerialNo: row['taskSerialNo'] as int?,
            taskName: row['taskName'] as String?,
            taskCreatedTime: row['taskCreatedTime'] as String?,
            taskStatus: row['taskStatus'] as int?,
            timer: row['timer'] == null ? null : (row['timer'] as int) != 0,
            lastTick: row['lastTick'] as int?,
            lastUpdated: row['lastUpdated'] as String?));
  }

  @override
  Future<List<TaskModel>> hFindTaskById(String id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM TaskModel WHERE taskSerialNo=?1',
        mapper: (Map<String, Object?> row) => TaskModel(
            taskSerialNo: row['taskSerialNo'] as int?,
            taskName: row['taskName'] as String?,
            taskCreatedTime: row['taskCreatedTime'] as String?,
            taskStatus: row['taskStatus'] as int?,
            timer: row['timer'] == null ? null : (row['timer'] as int) != 0,
            lastTick: row['lastTick'] as int?,
            lastUpdated: row['lastUpdated'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> hDeleteTaskFromDb(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM TaskModel WHERE taskSerialNo=?1',
        arguments: [id]);
  }

  @override
  Future<void> insertNewTask(TaskModel task) async {
    await _taskModelInsertionAdapter.insert(task, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateTask(TaskModel taskModel) async {
    await _taskModelUpdateAdapter.update(taskModel, OnConflictStrategy.abort);
  }
}
