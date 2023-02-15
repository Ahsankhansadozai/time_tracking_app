import 'package:floor/floor.dart';

import '../../../domain/model/Task.dart';

@dao
abstract class TaskDao {

  @Query('SELECT * FROM Task WHERE status=:status')
  Future<List<TaskModel>> hFindAllTaskWithStatus(String status);

  @Query('SELECT * FROM Task')
  Stream<List<TaskModel>> hFindAllTask();

  @Query('SELECT * FROM Task WHERE taskSerialNo=:id')
  Stream<TaskModel?> hFindTaskById(String id);

  @insert
  @OnConflictStrategy.replace
  Future<void> insertNewTask(TaskModel task);

  @Query('DELETE FROM Task WHERE taskSerialNo=:id')
  Future<void> deleteTask(String id);

  @update
  Future<void> updateTask(TaskModel cart);
}
