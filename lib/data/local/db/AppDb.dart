import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/model/Task.dart';
import '../dao/TaskDao.dart';

part 'AppDb.g.dart'; // the generated code will be there

@Database(version: 1, entities: [TaskModel])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
