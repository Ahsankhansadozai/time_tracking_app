import 'package:time_tracking_app/domain/model/Task.dart';

abstract class TaskRepository {
  hAddNewTask(TaskModel params);

  hFetchAllTaskFromLocalDb();

  hDeleteTaskFromDb(int taskSerialNo);


  hUpdateTaskFromDb(TaskModel taskModel);
}
