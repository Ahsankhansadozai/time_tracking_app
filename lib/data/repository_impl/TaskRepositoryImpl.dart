import 'package:time_tracking_app/common/custom_function.dart';
import 'package:time_tracking_app/data/local/db/AppDb.dart';
import 'package:time_tracking_app/domain/model/Task.dart';
import 'package:time_tracking_app/domain/repository/TaskRepository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final AppDatabase _appDatabase;

  TaskRepositoryImpl(this._appDatabase);

  @override
  hAddNewTask(TaskModel params) async {
    printLog("Task Create Call");
    try {
      await _appDatabase.taskDao.insertNewTask(params);
      printLog("Task Created");
    } catch (e) {
      printLog("$e");
    }
  }

  @override
  Future<List<TaskModel>> hFetchAllTaskFromLocalDb() async {
    return await _appDatabase.taskDao.hFindAllTask();
  }

  @override
  hDeleteTaskFromDb(int taskSerialNo) async {
    await _appDatabase.taskDao.hDeleteTaskFromDb(taskSerialNo);
  }

  @override
  hUpdateTaskFromDb(TaskModel task) async {
    await _appDatabase.taskDao.updateTask(task);
  }
}
