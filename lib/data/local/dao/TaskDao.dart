import 'package:floor/floor.dart';

import '../../../domain/model/Task.dart';

@dao
abstract class TaskDao {

  @Query('SELECT * FROM TaskModel WHERE status=:status')
  Future<List<TaskModel>> hFindAllTaskWithStatus(String status);

  @Query('SELECT * FROM TaskModel')
  Future<List<TaskModel>> hFindAllTask();

  @Query('SELECT * FROM TaskModel WHERE taskSerialNo=:id')
  Future<List<TaskModel>> hFindTaskById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNewTask(TaskModel task);

  @Query('DELETE FROM TaskModel WHERE taskSerialNo=:id')
  Future<void> hDeleteTaskFromDb(int id);

  @update
  Future<void> updateTask(TaskModel taskModel);
}
